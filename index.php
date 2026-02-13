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
// Hide QC & Rewinder team from the frontend (non-destructive). Keep team in DB.
$teams = array_values(array_filter($teams, function($t){
    $code = isset($t['team_code']) ? strtolower($t['team_code']) : '';
    $name = isset($t['team_name']) ? strtolower($t['team_name']) : '';

    return (
        $code !== 'qc' &&
        $code !== 'it' &&
        $code !== 'rewinder' &&
        $code !== 'accounting' &&
        strpos($name, 'qc') === false &&
        strpos($name, 'it') === false &&
        strpos($name, 'rewinder') === false &&
        strpos($name, 'accounting') === false
    );
}));
$week = isset($_GET['week']) ? intval($_GET['week']) : 1;
$schedule = getScheduleByWeek($week); // selected week
$leaderboard = getLeaderboard();
$groupStandings = getGroupStandings();
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
            <img src="assets/images/hero-utama.jpg" alt="Team Photo" class="hero-image">
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

    <!-- Keterangan (3 baris, 2 kolom, selang-seling) -->
    <section class="info-section background-section wave-top-right">
        <div class="info-wrapper">
            <!-- Baris 1: Text kiri, gambar kanan -->
            <div class="info-row">
                <div class="info-panel">
                    <h2 class="section-title">Latar Belakang Kegiatan</h2>
                    <div class="info-text">
                        <?php if (!empty($backgroundText)): ?>
                            <p><?php echo nl2br(htmlspecialchars($backgroundText)); ?></p>
                        <?php else: ?>
                            <p>Dalam rangka memperingati Bulan Kesehatan dan Keselamatan Kerja (K3), PT Indofood CBP Sukses Makmur Tbk menyelenggarakan kegiatan Turnamen Mini Soccer sebagai salah satu bentuk implementasi budaya K3 di lingkungan kerja.</p>
                            <p>Kegiatan ini bertujuan untuk meningkatkan kesadaran karyawan akan pentingnya kesehatan fisik, keselamatan kerja, serta mempererat kebersamaan dan sportivitas antar karyawan melalui aktivitas olahraga yang positif dan aman.</p>
                        <?php endif; ?>
                    </div>
                </div>
                <div class="info-decor">
                    <img src="GambarBagianLatarBelakang/gbr_awal.png" alt="Dekorasi Latar Belakang" class="info-decor-image">
                </div>
            </div>

            <!-- Baris 2: gambar kiri, text kanan -->
            <div class="info-row info-row--reverse">
                <div class="info-decor">
                    <img src="GambarBagianLatarBelakang/gbr_bulank3.png" alt="Dekorasi Bulan K3" class="info-decor-image">
                </div>
                <div class="info-panel">
                    <h2 class="section-title">Apa itu Bulan K3?</h2>
                    <div class="info-text">
                        <?php if (!empty($aboutK3)): ?>
                            <p><?php echo nl2br(htmlspecialchars($aboutK3)); ?></p>
                        <?php else: ?>
                            <p>Bulan K3 merupakan program nasional tahunan untuk meningkatkan penerapan Kesehatan dan Keselamatan Kerja (K3), guna menciptakan lingkungan kerja yang aman, sehat, produktif, serta menumbuhkan budaya keselamatan sebagai tanggung jawab bersama.</p>
                        <?php endif; ?>
                    </div>
                </div>
            </div>

            <!-- Baris 3: Text kiri, gambar kanan -->
            <div class="info-row wave-bottom-left">
                <div class="info-panel">
                    <h2 class="section-title">Tujuan Kegiatan</h2>
                    <div class="info-text">
                        <?php if (!empty($eventPurpose)): ?>
                            <p><?php echo nl2br(htmlspecialchars($eventPurpose)); ?></p>
                        <?php else: ?>
                            <p>Penyelenggaraan Turnamen Mini Soccer dalam rangka Bulan K3 ini bertujuan untuk:</p>
                            <ul>
                                <li>Meningkatkan kesadaran karyawan akan pentingnya kesehatan dan keselamatan kerja.</li>
                                <li>Mendorong gaya hidup sehat melalui aktivitas olahraga.</li>
                                <li>Mempererat hubungan dan kerja sama antar karyawan lintas departemen.</li>
                                <li>Menumbuhkan nilai sportivitas, disiplin, dan kebersamaan di lingkungan kerja.</li>
                                <li>Mendukung penerapan budaya K3 secara berkelanjutan di PT Indofood CBP Sukses Makmur Tbk.</li>
                            </ul>
                        <?php endif; ?>
                    </div>
                </div>
                <div class="info-decor">
                    <img src="GambarBagianLatarBelakang/gbr_kegiatan.png" alt="Dekorasi Tujuan Kegiatan" class="info-decor-image">
                </div>
            </div>

            <!-- Baris 4: Dekorasi bawah (3 kolom) -->
            <div class="info-decor-row">
                <img src="GambarBagianLatarBelakang/gbr_kiribawah1.png" alt="Dekorasi kiri bawah 1" class="info-decor-bottom">
                <img src="GambarBagianLatarBelakang/gbr_tengah bawah.png" alt="Dekorasi kiri bawah 2" class="info-decor-bottom">
                <img src="GambarBagianLatarBelakang/gambar_akhir.png" alt="Dekorasi kanan bawah" class="info-decor-bottom">
            </div>
        </div>
    </section>

    <!-- Jadwal Section -->
    <section class="schedule-section">
        <h2 class="section-title">JADWAL</h2>
        <div class="week-buttons" style="margin-bottom:12px;">
            <?php for ($w=1; $w<=7; $w++): ?>
                <a href="?week=<?php echo $w; ?>" class="week-btn" style="display:inline-block;margin-right:6px;padding:6px 10px;border-radius:6px;text-decoration:none;background:<?php echo $week===$w ? '#1e3c72' : '#f0f0f0'; ?>;color:<?php echo $week===$w ? '#fff' : '#333'; ?>;">WEEK <?php echo $w; ?></a>
            <?php endfor; ?>
        </div>
        <div class="schedule-container">
            <?php
            // Generate schedule table
            $times = ['19:00', '20:00', '21:00', '22:00', '23:00', '00:00'];
            $daysIndonesian = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
            
            // Get first date from schedule or use current week
            $firstDate = null;
            if (!empty($schedule)) {
                $firstDate = new DateTime($schedule[0]['match_date']);
            } else {
                $firstDate = new DateTime();
                $firstDate->modify('monday this week');
            }
            
            // Create schedule map (allow multiple matches at same date+time)
            $scheduleMap = [];
            foreach ($schedule as $s) {
                $dateKey = $s['match_date'];
                // Normalisasi waktu ke format HH:MM agar cocok dengan array $times
                $timeKey = substr($s['match_time'], 0, 5);
                if (!isset($scheduleMap[$dateKey])) $scheduleMap[$dateKey] = [];
                if (!isset($scheduleMap[$dateKey][$timeKey])) $scheduleMap[$dateKey][$timeKey] = [];
                $scheduleMap[$dateKey][$timeKey][] = $s;
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
                                $dayOfWeek = (int)$currentDate->format('w');
                                $dayName = $daysIndonesian[$dayOfWeek];
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
                                    $matchesAtCell = isset($scheduleMap[$dateKey][$time]) ? $scheduleMap[$dateKey][$time] : [];
                                ?>
                                    <td class="schedule-cell <?php echo !empty($matchesAtCell) ? 'has-match' : ''; ?>">
                                        <?php if (!empty($matchesAtCell)): ?>
                                            <?php foreach ($matchesAtCell as $match): ?>
                                                <?php if ($match['match_status'] == 'ongoing'): ?>
                                                    <div class="match-info ongoing">
                                                        <?php echo htmlspecialchars($match['home_team_name']); ?> VS <?php echo htmlspecialchars($match['away_team_name']); ?>
                                                    </div>
                                                <?php else: ?>
                                                    <div class="match-info">
                                                        <?php echo htmlspecialchars($match['home_team_name']); ?> VS <?php echo htmlspecialchars($match['away_team_name']); ?>
                                                    </div>
                                                <?php endif; ?>
                                            <?php endforeach; ?>
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
            <?php if (!empty($groupStandings) && is_array($groupStandings)): ?>
                <?php foreach ($groupStandings as $groupName => $teamsList): ?>
                    <div class="group-standings" style="margin-bottom:18px;">
                        <h3 style="margin:6px 0 8px 0;">Group <?php echo htmlspecialchars($groupName); ?></h3>
                        <div style="overflow-x:auto;">
                            <table class="leaderboard-table" style="width:100%;">
                                <thead>
                                    <tr>
                                        <th style="text-align:left; padding:8px;">Team</th>
                                        <th style="padding:8px; text-align:center;">Match</th>
                                        <th style="padding:8px; text-align:center;">Win</th>
                                        <th style="padding:8px; text-align:center;">Draw</th>
                                        <th style="padding:8px; text-align:center;">Lose</th>
                                        <th style="padding:8px; text-align:center;">Goals</th>
                                        <th style="padding:8px; text-align:center;">Total Poin</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (empty($teamsList)): ?>
                                        <tr><td colspan="6" style="padding:12px; text-align:center;">Belum ada tim untuk group ini.</td></tr>
                                    <?php else: ?>
                                        <?php foreach ($teamsList as $t): ?>
                                            <tr>
                                                <td style="padding:8px;">
                                                    <div style="display:flex;align-items:center;gap:8px;">
                                                        <?php if (!empty($t['team_logo'])): ?>
                                                            <img src="<?php echo htmlspecialchars($t['team_logo']); ?>" alt="<?php echo htmlspecialchars($t['team_name']); ?>" style="width:34px;height:34px;border-radius:6px;object-fit:cover;">
                                                        <?php else: ?>
                                                            <span class="material-symbols-outlined" style="font-size:28px;color:#1e3c72;">shield</span>
                                                        <?php endif; ?>
                                                        <span><?php echo htmlspecialchars($t['team_name']); ?></span>
                                                    </div>
                                                </td>
                                                <td style="text-align:center; padding:8px;"><?php echo $t['played']; ?></td>
                                                <td style="text-align:center; padding:8px;"><?php echo $t['win']; ?></td>
                                                <td style="text-align:center; padding:8px;"><?php echo $t['draw']; ?></td>
                                                <td style="text-align:center; padding:8px;"><?php echo $t['lose']; ?></td>
                                                <td style="text-align:center; padding:8px;"><?php echo $t['goals_for'] . ':' . $t['goals_against']; ?></td>
                                                <td style="text-align:center; padding:8px;"><?php echo $t['points']; ?></td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <p>Tidak ada data klasemen grup.</p>
            <?php endif; ?>
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
                                                <?php if (!empty($match['home_team_logo'])): ?>
                                                    <img src="<?php echo htmlspecialchars($match['home_team_logo']); ?>" alt="<?php echo htmlspecialchars($match['home_team_name']); ?>">
                                                <?php else: ?>
                                                    <span class="material-symbols-outlined" style="font-size:34px;color:#fff;">shield</span>
                                                <?php endif; ?>
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
                                            <?php if (!empty($match['away_team_logo'])): ?>
                                                <img src="<?php echo htmlspecialchars($match['away_team_logo']); ?>" alt="<?php echo htmlspecialchars($match['away_team_name']); ?>">
                                            <?php else: ?>
                                                <span class="material-symbols-outlined" style="font-size:34px;color:#fff;">shield</span>
                                            <?php endif; ?>
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
                                    <?php if (!empty($team['team_logo'])): ?>
                                        <img src="<?php echo htmlspecialchars($team['team_logo']); ?>" alt="<?php echo htmlspecialchars($team['team_name']); ?>">
                                    <?php else: ?>
                                        <span class="material-symbols-outlined" style="font-size:48px;color:#1e3c72;">shield</span>
                                    <?php endif; ?>
                                </div>
                                <button class="carousel-arrow carousel-arrow-right" onclick="nextTeam()">
                                    <span class="material-symbols-outlined">arrow_forward_ios</span>
                                </button>
                            </div>
                            <button class="btn-view-players" onclick="viewPlayers('<?php echo htmlspecialchars($team['team_code']); ?>')">
                                <span class="material-symbols-outlined">groups</span>
                                LIHAT PEMAIN
                            </button>
                            <?php
                                // Preload players HTML server-side to avoid relying on XHR (some hosts inject interstitials)
                                $prePlayers = getPlayersByTeamCode($team['team_code']);
                                $playersHtml = '';
                                if (!empty($prePlayers)) {
                                    $playersHtml .= '<h3 style="margin-bottom: 20px; color: #1e3c72;">' . htmlspecialchars($team['team_name']) . '</h3>';
                                    $playersHtml .= '<table style="width:100%; border-collapse:collapse;"><thead><tr style="border-bottom:2px solid #ddd;"><th style="text-align:left; padding:8px; background:#f5f5f5;">No</th><th style="text-align:left; padding:8px; background:#f5f5f5;">Nama Pemain</th></tr></thead><tbody>';
                                    $idx = 1;
                                    foreach ($prePlayers as $p) {
                                        $playersHtml .= '<tr style="border-bottom:1px solid #eee;"><td style="padding:8px;">' . $idx . '</td><td style="padding:8px;">' . htmlspecialchars($p['player_name']) . '</td></tr>';
                                        $idx++;
                                    }
                                    $playersHtml .= '</tbody></table>';
                                } else {
                                    $playersHtml = '<p style="text-align: center; padding: 20px; color: #666;">Belum ada data pemain untuk tim ini.</p>';
                                }
                                echo '<div id="players_data_' . htmlspecialchars($team['team_code']) . '" style="display:none;">' . $playersHtml . '</div>';
                            ?>
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

