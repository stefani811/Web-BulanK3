<?php
require_once __DIR__ . '/includes/functions.php';

$eventInfo = getEventInfo();
$eventTitle = $eventInfo && isset($eventInfo['event_title']) ? $eventInfo['event_title'] : 'BULAN K3 NASIONAL';
$eventYear = $eventInfo && isset($eventInfo['event_year']) ? $eventInfo['event_year'] : 2026;
$eventVision = $eventInfo && isset($eventInfo['event_vision']) ? $eventInfo['event_vision'] : 'Membangun Ekosistem Pengelolaan K3 Nasional yang Profesional, Andal, dan Kolaboratif';
$backgroundText = $eventInfo && isset($eventInfo['background_text']) ? $eventInfo['background_text'] : '';
$aboutK3 = $eventInfo && isset($eventInfo['about_k3']) ? $eventInfo['about_k3'] : '';
$eventPurpose = $eventInfo && isset($eventInfo['event_purpose']) ? $eventInfo['event_purpose'] : '';

$matches = getAllMatchesWithOngoing();
$teams = getAllTeams();
$schedule = getScheduleByWeek(1); // Week 1
$leaderboard = getLeaderboard();
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

    <!-- Latar Belakang Kegiatan Section -->
    <section class="info-section background-section wave-top-right">
        <div class="info-wrapper">
            <h2 class="section-title">Latar Belakang Kegiatan</h2>
            <div class="info-grid">
                <div class="info-text-col">
                    <?php if (!empty($backgroundText)): ?>
                        <p><?php echo nl2br(htmlspecialchars($backgroundText)); ?></p>
                    <?php else: ?>
                        <p>Dalam rangka memperingati Bulan Kesehatan dan Keselamatan Kerja (K3), PT Indofood CBP Sukses Makmur Tbk menyelenggarakan kegiatan Turnamen Mini Soccer sebagai salah satu bentuk implementasi budaya K3 di lingkungan kerja.</p>
                        <p>Kegiatan ini bertujuan untuk meningkatkan kesadaran karyawan akan pentingnya kesehatan fisik, keselamatan kerja, serta mempererat kebersamaan dan sportivitas antar karyawan melalui aktivitas olahraga yang positif dan aman.</p>
                    <?php endif; ?>
                </div>
                <div class="info-image-col">
                    <img src="GambarBagianLatarBelakang/gbr 1.png" alt="Latar Belakang" class="info-image">
                </div>
            </div>
        </div>
    </section>

    <!-- Apa itu Bulan K3 Section -->
    <section class="info-section background-section">
        <div class="info-wrapper">
            <h2 class="section-title">Apa itu Bulan K3?</h2>
            <div class="info-grid">
                <div class="info-text-col">
                    <?php if (!empty($aboutK3)): ?>
                        <p><?php echo nl2br(htmlspecialchars($aboutK3)); ?></p>
                    <?php else: ?>
                        <p>Bulan K3 merupakan program nasional tahunan untuk meningkatkan penerapan Kesehatan dan Keselamatan Kerja (K3), guna menciptakan lingkungan kerja yang aman, sehat, produktif, serta menumbuhkan budaya keselamatan sebagai tanggung jawab bersama.</p>
                    <?php endif; ?>
                </div>
                <div class="info-image-col">
                    <img src="GambarBagianLatarBelakang/gbr 2.png" alt="Apa itu Bulan K3" class="info-image">
                </div>
            </div>
        </div>
    </section>

    <!-- Tujuan Kegiatan Section -->
    <section class="info-section background-section wave-bottom-left">
        <div class="info-wrapper">
            <h2 class="section-title">Tujuan Kegiatan</h2>
            <div class="info-grid">
                <div class="info-text-col">
                    <?php if (!empty($eventPurpose)): ?>
                        <p><?php echo nl2br(htmlspecialchars($eventPurpose)); ?></p>
                    <?php else: ?>
                        <p>Penyelenggaraan Turnamen Mini Soccer dalam rangka Bulan K3 ini bertujuan untuk:</p>
                        <ul>
                            <li>Meningkatkan kesadaran karyawan akan pentingnya kesehatan dan keselamatan kerja.</li>
                            <li>mendorong gaya hidup sehat.</li>
                            <li>Mempererat hubungan dan kerja sama antar karyawan lintas departemen.</li>
                            <li>Menumbuhkan nilai sportivitas, disiplin, dan kebersamaan di lingkungan kerja.</li>
                            <li>Mendukung penerapan budaya K3 secara berkelanjutan di PT Indofood CBP Sukses Makmur Tbk.</li>
                        </ul>
                    <?php endif; ?>
                </div>
                <div class="info-image-col">
                    <img src="GambarBagianLatarBelakang/gbr 3.png" alt="Tujuan Kegiatan" class="info-image">
                </div>
            </div>
        </div>
    </section>

    <!-- Jadwal Section -->
    <section class="schedule-section">
        <h2 class="section-title">JADWAL</h2>
        <div class="schedule-container">
            <?php
            // Generate schedule table
            $times = ['19:00', '20:00', '21:00', '22:00', '23:00', '00:00'];
            $days = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];
            
            // Get first date from schedule or use current week
            $firstDate = null;
            if (!empty($schedule)) {
                $firstDate = new DateTime($schedule[0]['match_date']);
            } else {
                $firstDate = new DateTime();
                $firstDate->modify('monday this week');
            }
            
            // Create schedule map
            $scheduleMap = [];
            foreach ($schedule as $s) {
                $dateKey = $s['match_date'];
                $timeKey = $s['match_time'];
                $scheduleMap[$dateKey][$timeKey] = $s;
            }
            ?>
            <div class="schedule-wrapper">
                <table class="schedule-table">
                    <thead>
                        <tr>
                            <th>Waktu</th>
                            <?php for ($i = 0; $i < 7; $i++): 
                                $currentDate = clone $firstDate;
                                $currentDate->modify("+$i days");
                                $dayName = $days[$i];
                                $dateStr = $currentDate->format('M d');
                            ?>
                                <th>
                                    <div class="schedule-date-header">
                                        <div class="schedule-day"><?php echo $dayName; ?></div>
                                        <div class="schedule-date"><?php echo $dateStr; ?></div>
                                    </div>
                                </th>
                            <?php endfor; ?>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($times as $time): ?>
                            <tr>
                                <td class="time-cell"><?php echo $time; ?></td>
                                <?php for ($i = 0; $i < 7; $i++): 
                                    $currentDate = clone $firstDate;
                                    $currentDate->modify("+$i days");
                                    $dateKey = $currentDate->format('Y-m-d');
                                    $hasMatch = isset($scheduleMap[$dateKey][$time]);
                                    $match = $hasMatch ? $scheduleMap[$dateKey][$time] : null;
                                ?>
                                    <td class="schedule-cell <?php echo $hasMatch ? 'has-match' : ''; ?>">
                                        <?php if ($match): ?>
                                            <?php if ($match['match_status'] == 'ongoing'): ?>
                                                <div class="match-info ongoing">
                                                    <?php echo htmlspecialchars($match['home_team_name']); ?> VS <?php echo htmlspecialchars($match['away_team_name']); ?>
                                                </div>
                                            <?php else: ?>
                                                <div class="match-info">
                                                    <?php echo htmlspecialchars($match['home_team_name']); ?> VS <?php echo htmlspecialchars($match['away_team_name']); ?>
                                                </div>
                                            <?php endif; ?>
                                        <?php endif; ?>
                                    </td>
                                <?php endfor; ?>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <!-- Leaderboard Section -->
    <section class="leaderboard-section">
        <h2 class="section-title">LEADERBOARD</h2>
        <div class="trophies-container">
            <div class="trophy trophy-2">
                <span class="material-symbols-outlined trophy-icon">emoji_events</span>
                <span class="trophy-label">2</span>
            </div>
            <div class="trophy trophy-1">
                <span class="material-symbols-outlined trophy-icon">emoji_events</span>
                <span class="trophy-label">1</span>
            </div>
            <div class="trophy trophy-3">
                <span class="material-symbols-outlined trophy-icon">emoji_events</span>
                <span class="trophy-label">3</span>
            </div>
        </div>
        <div class="leaderboard-container">
            <table class="leaderboard-table">
                <thead>
                    <tr>
                        <th class="sortable" data-sort="rank">
                            RK
                            <span class="sort-icon material-symbols-outlined">expand_all</span>
                        </th>
                        <th class="sortable" data-sort="team">
                            Team
                            <span class="sort-icon material-symbols-outlined">expand_all</span>
                        </th>
                        <th class="sortable" data-sort="score">
                            Total Score
                            <span class="sort-icon material-symbols-outlined">expand_all</span>
                        </th>
                    </tr>
                </thead>
                <tbody id="leaderboardBody">
                    <?php foreach ($leaderboard as $entry): ?>
                        <tr>
                            <td><?php echo $entry['rank']; ?></td>
                            <td>
                                <div class="leaderboard-team">
                                    <?php if ($entry['team_logo']): ?>
                                        <img src="<?php echo htmlspecialchars($entry['team_logo']); ?>" alt="<?php echo htmlspecialchars($entry['team_name']); ?>" class="leaderboard-logo">
                                    <?php endif; ?>
                                    <span><?php echo htmlspecialchars($entry['team_name']); ?></span>
                                </div>
                            </td>
                            <td><?php echo $entry['total_score']; ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
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
                                    <td class="score">
                                        <?php if ($match['match_status'] == 'ongoing'): ?>
                                            VS
                                        <?php else: ?>
                                            <?php echo $match['score_home']; ?> - <?php echo $match['score_away']; ?>
                                        <?php endif; ?>
                                    </td>
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

