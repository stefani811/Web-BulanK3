<?php
require_once __DIR__ . '/../config/db.php';

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

function getPlayersByTeamCode($teamCode) {
    $team = getTeamByCode($teamCode);
    if ($team) {
        return getPlayersByTeamId($team['id']);
    }
    return [];
}

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

function addPlayer($teamId, $playerName, $playerNumber = null, $position = null) {
    $conn = getDBConnection();
    $stmt = $conn->prepare("INSERT INTO players (team_id, player_name, player_number, position) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("isis", $teamId, $playerName, $playerNumber, $position);
    
    $success = $stmt->execute();
    $stmt->close();
    closeDBConnection($conn);
    
    return $success;
}

function addTeam($teamCode, $teamName, $teamLogo = null) {
    $conn = getDBConnection();
    $stmt = $conn->prepare("INSERT INTO teams (team_code, team_name, team_logo) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $teamCode, $teamName, $teamLogo);
    
    $success = $stmt->execute();
    $stmt->close();
    closeDBConnection($conn);
    
    return $success;
}

/**
 * Get schedule by week number
 */
function getScheduleByWeek($weekNumber = 1) {
    $conn = getDBConnection();
    $stmt = $conn->prepare("SELECT s.*, 
                                   t1.team_name as home_team_name, 
                                   t1.team_code as home_team_code,
                                   t2.team_name as away_team_name, 
                                   t2.team_code as away_team_code
                            FROM schedule s
                            INNER JOIN teams t1 ON s.team_home_id = t1.id
                            INNER JOIN teams t2 ON s.team_away_id = t2.id
                            WHERE s.week_number = ?
                            ORDER BY s.match_date ASC, s.match_time ASC");
    $stmt->bind_param("i", $weekNumber);
    $stmt->execute();
    $result = $stmt->get_result();
    
    $schedule = [];
    if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $schedule[] = $row;
        }
    }
    
    $stmt->close();
    closeDBConnection($conn);
    return $schedule;
}

/**
 * Get leaderboard (total score per team)
 */
function getLeaderboard() {
    $conn = getDBConnection();
    $sql = "SELECT 
                t.id,
                t.team_code,
                t.team_name,
                t.team_logo,
                COALESCE(SUM(CASE 
                    WHEN m.team_home_id = t.id THEN m.score_home
                    WHEN m.team_away_id = t.id THEN m.score_away
                    ELSE 0
                END), 0) as total_score
            FROM teams t
            LEFT JOIN matches m ON (m.team_home_id = t.id OR m.team_away_id = t.id) 
                AND m.match_status = 'finished'
            GROUP BY t.id, t.team_code, t.team_name, t.team_logo
            ORDER BY total_score DESC, t.team_name ASC";
    
    $result = $conn->query($sql);
    
    $leaderboard = [];
    if ($result && $result->num_rows > 0) {
        $rank = 1;
        while ($row = $result->fetch_assoc()) {
            $row['rank'] = $rank++;
            $leaderboard[] = $row;
        }
    }
    
    closeDBConnection($conn);
    return $leaderboard;
}

/**
 * Get standings grouped by logical groups.
 * Group membership is defined by team_code values in the $groupMap array.
 * Returns an associative array: ['A' => [ {team...}, ... ], 'B' => [...]]
 */
function getGroupStandings() {
    // Define groups here. Adjust the team_code keys to match your `teams.team_code` values in DB.
    $groupMap = [
        // Removed 'accounting' from Group A per request
        'A' => ['ppic', 'laminasi', 'teknik'],
        'B' => ['hr', 'supporting', 'slitter'],
        'C' => ['security', 'warehouse', 'printing'],
        // Use 'quality' team_code (Quality Squad) instead of 'qc'
        'D' => ['quality', 'btp', 'puk']
    ];

    $conn = getDBConnection();

    // Load finished matches
    $sql = "SELECT m.*, m.team_home_id, m.team_away_id, t1.team_code as home_team_code, t2.team_code as away_team_code
            FROM matches m
            INNER JOIN teams t1 ON m.team_home_id = t1.id
            INNER JOIN teams t2 ON m.team_away_id = t2.id
            WHERE m.match_status = 'finished'";

    $result = $conn->query($sql);
    $matches = [];
    if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $matches[] = $row;
        }
    }

    // Prepare standings container
    $standings = [];
    foreach ($groupMap as $groupName => $codes) {
        // initialize teams present in this group from teams table
        // build a safely escaped IN list
        $escaped = array_map(function($c) use ($conn) {
            return "'" . $conn->real_escape_string($c) . "'";
        }, $codes);
        $inList = implode(',', $escaped);
        $sqlTeams = "SELECT id, team_code, team_name, team_logo FROM teams WHERE team_code IN ($inList)";
        $res = $conn->query($sqlTeams);

        $teams = [];
        if ($res && $res->num_rows > 0) {
            while ($r = $res->fetch_assoc()) {
                $teams[strtolower($r['team_code'])] = [
                    'id' => $r['id'],
                    'team_code' => $r['team_code'],
                    'team_name' => $r['team_name'],
                    'team_logo' => $r['team_logo'],
                    'played' => 0,
                    'win' => 0,
                    'draw' => 0,
                    'lose' => 0,
                    'points' => 0
                ];
            }
        }

        // compute standings using finished matches where both teams are in same group
        foreach ($matches as $m) {
            $homeCode = strtolower($m['home_team_code']);
            $awayCode = strtolower($m['away_team_code']);

            if (!in_array($homeCode, $codes) || !in_array($awayCode, $codes)) continue;

            // ensure both teams exist in fetched teams list
            if (!isset($teams[$homeCode]) || !isset($teams[$awayCode])) continue;

            $homeScore = intval($m['score_home']);
            $awayScore = intval($m['score_away']);

            // increment played
            $teams[$homeCode]['played']++;
            $teams[$awayCode]['played']++;

            if ($homeScore > $awayScore) {
                $teams[$homeCode]['win']++;
                $teams[$awayCode]['lose']++;
                $teams[$homeCode]['points'] += 3;
            } elseif ($homeScore < $awayScore) {
                $teams[$awayCode]['win']++;
                $teams[$homeCode]['lose']++;
                $teams[$awayCode]['points'] += 3;
            } else {
                $teams[$homeCode]['draw']++;
                $teams[$awayCode]['draw']++;
                $teams[$homeCode]['points'] += 1;
                $teams[$awayCode]['points'] += 1;
            }
        }

        // convert to numerically sortable list and sort by points desc, win desc, played asc, name asc
        $groupList = array_values($teams);
        usort($groupList, function($a, $b) {
            if ($a['points'] !== $b['points']) return $b['points'] - $a['points'];
            if ($a['win'] !== $b['win']) return $b['win'] - $a['win'];
            if ($a['played'] !== $b['played']) return $a['played'] - $b['played'];
            return strcasecmp($a['team_name'], $b['team_name']);
        });

        $standings[$groupName] = $groupList;
    }

    closeDBConnection($conn);
    return $standings;
}

/**
 * Get all matches including ongoing
 */
function getAllMatchesWithOngoing() {
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
            ORDER BY 
                CASE m.match_status 
                    WHEN 'ongoing' THEN 1
                    WHEN 'finished' THEN 2
                    WHEN 'scheduled' THEN 3
                END,
                m.match_date DESC, 
                m.created_at DESC";
    
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
?>

