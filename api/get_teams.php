<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../includes/functions.php';

$teams = getAllTeams();
echo json_encode($teams, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
?>

