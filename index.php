<?php
require_once __DIR__ . '/includes/functions.php';

$eventInfo = getEventInfo();
$eventTitle = $eventInfo ? $eventInfo['event_title'] : 'BULAN K3 NASIONAL';
$eventYear = $eventInfo ? $eventInfo['event_year'] : 2026;
$eventVision = $eventInfo ? $eventInfo['event_vision'] : 'Membangun Ekosistem Pengelolaan K3 Nasional yang Profesional, Andal, dan Kolaboratif';

$matches = getAllMatches();

$teams = getAllTeams();
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($eventTitle); ?> <?php echo $eventYear; ?> - Mini Soccer Tournament</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-background">
            <img src="assets/images/hero-team.jpg" alt="Team Photo" class="hero-image">
            <div class="hero-overlay"></div>
        </div>
        <div class="logo-k3">
            <img src="assets/images/logo-k3.png" alt="K3 Logo">
        </div>
        <div class="logo-indofood">
            <img src="assets/images/logo-indofood.png" alt="Indofood Logo">
        </div>
        <div class="hero-content">
            <h1 class="hero-title"><?php echo htmlspecialchars($eventTitle); ?></h1>
            <h2 class="hero-year"><?php echo $eventYear; ?></h2>
            <p class="hero-vision"><?php echo htmlspecialchars($eventVision); ?></p>
        </div>
    </section>

    <!-- Scoreboard Section -->
    <section class="scoreboard-section">
        <h2 class="section-title">SCOREBOARD</h2>
        <div class="scoreboard-container">
            <div class="scoreboard-wrapper">
                <table class="scoreboard-table">
                    <tbody id="scoreboardBody">
                        <?php if (empty($matches)): ?>
                            <tr class="scoreboard-item">
                                <td colspan="3" style="text-align: center; color: white; padding: 40px;">
                                    Belum ada data pertandingan
                                </td>
                            </tr>
                        <?php else: ?>
                            <?php foreach ($matches as $match): ?>
                                <tr class="scoreboard-item">
                                    <td class="team-left">
                                        <div class="team-logo">
                                            <img src="<?php echo htmlspecialchars($match['home_team_logo']); ?>" alt="<?php echo htmlspecialchars($match['home_team_name']); ?>">
                                        </div>
                                        <div class="team-name"><?php echo htmlspecialchars(strtoupper($match['home_team_name'])); ?></div>
                                    </td>
                                    <td class="score"><?php echo $match['score_home']; ?> - <?php echo $match['score_away']; ?></td>
                                    <td class="team-right">
                                        <div class="team-logo">
                                            <img src="<?php echo htmlspecialchars($match['away_team_logo']); ?>" alt="<?php echo htmlspecialchars($match['away_team_name']); ?>">
                                        </div>
                                        <div class="team-name"><?php echo htmlspecialchars(strtoupper($match['away_team_name'])); ?></div>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section class="team-section">
        <h2 class="section-title">TEAM</h2>
        <div class="team-carousel-container">
            <div class="team-carousel" id="teamCarousel">
                <?php if (empty($teams)): ?>
                    <div class="team-card">
                        <p style="text-align: center; padding: 40px;">Belum ada data tim</p>
                    </div>
                <?php else: ?>
                    <?php foreach ($teams as $team): ?>
                        <div class="team-card">
                            <div class="team-logo-container">
                                <button class="carousel-arrow carousel-arrow-left" onclick="previousTeam()">
                                    <span class="material-symbols-outlined">arrow_back_ios</span>
                                </button>
                                <div class="team-logo-large">
                                    <img src="<?php echo htmlspecialchars($team['team_logo']); ?>" alt="<?php echo htmlspecialchars($team['team_name']); ?>">
                                </div>
                                <button class="carousel-arrow carousel-arrow-right" onclick="nextTeam()">
                                    <span class="material-symbols-outlined">arrow_forward_ios</span>
                                </button>
                            </div>
                            <button class="btn-view-players" onclick="viewPlayers('<?php echo htmlspecialchars($team['team_code']); ?>')">
                                <span class="material-symbols-outlined">groups</span>
                                LIHAT PEMAIN
                            </button>
                        </div>
                    <?php endforeach; ?>
                <?php endif; ?>
            </div>
        </div>
    </section>

    <div id="playersModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Daftar Pemain</h2>
            <div id="playersList"></div>
        </div>
    </div>

    <script src="assets/js/script.js"></script>
</body>
</html>

