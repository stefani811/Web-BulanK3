<?php
require_once __DIR__ . '/../config/db.php';

/**
 * Get all teams
 */
function getAllTeams() {
    $conn = getDBConnection();
    $sql = "SELECT * FROM teams ORDER BY team_name ASC";
    $result = $conn->query($sql);
    
    $teams = [];
    if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $teams[] = $row;
        }
    }
    
    closeDBConnection($conn);
    return $teams;
}

/**
 * Get team by code
 */
function getTeamByCode($teamCode) {
    $conn = getDBConnection();
    $stmt = $conn->prepare("SELECT * FROM teams WHERE team_code = ?");
    $stmt->bind_param("s", $teamCode);
    $stmt->execute();
    $result = $stmt->get_result();
    
    $team = null;
    if ($result && $result->num_rows > 0) {
        $team = $result->fetch_assoc();
    }
    
    $stmt->close();
    closeDBConnection($conn);
    return $team;
}

/**
 * Get players by team ID
 */
function getPlayersByTeamId($teamId) {
    $conn = getDBConnection();
    $stmt = $conn->prepare("SELECT * FROM players WHERE team_id = ? ORDER BY player_number ASC, player_name ASC");
    $stmt->bind_param("i", $teamId);
    $stmt->execute();
    $result = $stmt->get_result();
    
    $players = [];
    if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $players[] = $row;
        }
    }
    
    $stmt->close();
    closeDBConnection($conn);
    return $players;
}

/**
 * Get players by team code
 */
function getPlayersByTeamCode($teamCode) {
    $team = getTeamByCode($teamCode);
    if ($team) {
        return getPlayersByTeamId($team['id']);
    }
    return [];
}

/**
 * Get all matches (latest first)
 */
function getAllMatches() {
    $conn = getDBConnection();
    $sql = "SELECT m.*, 
                   t1.team_name as home_team_name, 
                   t1.team_logo as home_team_logo,
                   t1.team_code as home_team_code,
                   t2.team_name as away_team_name, 
                   t2.team_logo as away_team_logo,
                   t2.team_code as away_team_code
            FROM matches m
            INNER JOIN teams t1 ON m.team_home_id = t1.id
            INNER JOIN teams t2 ON m.team_away_id = t2.id
            WHERE m.match_status = 'finished'
            ORDER BY m.match_date DESC, m.created_at DESC";
    
    $result = $conn->query($sql);
    
    $matches = [];
    if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $matches[] = $row;
        }
    }
    
    closeDBConnection($conn);
    return $matches;
}

/**
 * Get event information
 */
function getEventInfo() {
    $conn = getDBConnection();
    $sql = "SELECT * FROM event_info ORDER BY id DESC LIMIT 1";
    $result = $conn->query($sql);
    
    $eventInfo = null;
    if ($result && $result->num_rows > 0) {
        $eventInfo = $result->fetch_assoc();
    }
    
    closeDBConnection($conn);
    return $eventInfo;
}

/**
 * Add new match
 */
function addMatch($teamHomeId, $teamAwayId, $scoreHome, $scoreAway, $matchDate = null) {
    $conn = getDBConnection();
    
    if ($matchDate === null) {
        $matchDate = date('Y-m-d H:i:s');
    }
    
    $stmt = $conn->prepare("INSERT INTO matches (team_home_id, team_away_id, score_home, score_away, match_date, match_status) VALUES (?, ?, ?, ?, ?, 'finished')");
    $stmt->bind_param("iiiss", $teamHomeId, $teamAwayId, $scoreHome, $scoreAway, $matchDate);
    
    $success = $stmt->execute();
    $stmt->close();
    closeDBConnection($conn);
    
    return $success;
}

/**
 * Add new player
 */
function addPlayer($teamId, $playerName, $playerNumber = null, $position = null) {
    $conn = getDBConnection();
    $stmt = $conn->prepare("INSERT INTO players (team_id, player_name, player_number, position) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("isis", $teamId, $playerName, $playerNumber, $position);
    
    $success = $stmt->execute();
    $stmt->close();
    closeDBConnection($conn);
    
    return $success;
}

/**
 * Add new team
 */
function addTeam($teamCode, $teamName, $teamLogo = null) {
    $conn = getDBConnection();
    $stmt = $conn->prepare("INSERT INTO teams (team_code, team_name, team_logo) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $teamCode, $teamName, $teamLogo);
    
    $success = $stmt->execute();
    $stmt->close();
    closeDBConnection($conn);
    
    return $success;
}
?>

