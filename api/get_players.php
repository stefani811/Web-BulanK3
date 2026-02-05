<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../includes/functions.php';

$teamCode = isset($_GET['team_code']) ? $_GET['team_code'] : '';

if (empty($teamCode)) {
    echo json_encode(['error' => 'Team code is required'], JSON_PRETTY_PRINT);
    exit;
}

$players = getPlayersByTeamCode($teamCode);
$team = getTeamByCode($teamCode);

$response = [
    'team' => $team,
    'players' => $players
];

echo json_encode($response, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
?>

