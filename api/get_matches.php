<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../includes/functions.php';

$matches = getAllMatches();
echo json_encode($matches, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
?>

