<?php
require_once __DIR__ . '/includes/functions.php';

$conn = getDBConnection();

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!empty($_POST['action']) && $_POST['action'] === 'delete' && !empty($_POST['id'])) {
        $stmt = $conn->prepare('DELETE FROM matches WHERE id = ?');
        $stmt->bind_param('i', $_POST['id']);
        $stmt->execute();
        $stmt->close();
        header('Location: admin_matches.php');
        exit;
    }

    if (!empty($_POST['action']) && $_POST['action'] === 'save') {
        $id = intval($_POST['id']);
        $home = intval($_POST['team_home_id']);
        $away = intval($_POST['team_away_id']);
        $score_home = intval($_POST['score_home']);
        $score_away = intval($_POST['score_away']);
        $match_date = trim($_POST['match_date']);
        $status = in_array($_POST['match_status'], ['scheduled','ongoing','finished']) ? $_POST['match_status'] : 'scheduled';

        if ($id > 0) {
            $stmt = $conn->prepare('UPDATE matches SET team_home_id=?, team_away_id=?, score_home=?, score_away=?, match_date=?, match_status=?, updated_at=NOW() WHERE id=?');
            $stmt->bind_param('iiiissi', $home, $away, $score_home, $score_away, $match_date, $status, $id);
            $stmt->execute();
            $stmt->close();
        } else {
            $stmt = $conn->prepare('INSERT INTO matches (team_home_id, team_away_id, score_home, score_away, match_date, match_status) VALUES (?, ?, ?, ?, ?, ?)');
            $stmt->bind_param('iiiiss', $home, $away, $score_home, $score_away, $match_date, $status);
            $stmt->execute();
            $stmt->close();
        }

        header('Location: admin_matches.php');
        exit;
    }
}

// Fetch teams
$teams = [];
$res = $conn->query('SELECT id, team_code, team_name FROM teams ORDER BY team_name ASC');
if ($res) {
    while ($r = $res->fetch_assoc()) $teams[$r['id']] = $r;
}

// Fetch matches
$matches = [];
$sql = "SELECT m.*, t1.team_name AS home_name, t2.team_name AS away_name FROM matches m LEFT JOIN teams t1 ON m.team_home_id = t1.id LEFT JOIN teams t2 ON m.team_away_id = t2.id ORDER BY m.match_date DESC";
$res = $conn->query($sql);
if ($res) {
    while ($r = $res->fetch_assoc()) $matches[] = $r;
}

closeDBConnection($conn);
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Admin Matches</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>table{width:100%;border-collapse:collapse}td,th{padding:8px;border:1px solid #ddd}</style>
</head>
<body style="padding:20px;font-family:Arial,sans-serif">
    <h2>Manage Matches</h2>

    <h3>Add New Match</h3>
    <form method="post" style="margin-bottom:20px;">
        <input type="hidden" name="action" value="save">
        <input type="hidden" name="id" value="0">
        <label>Home:
            <select name="team_home_id">
                <?php foreach ($teams as $t): ?>
                    <option value="<?php echo $t['id']; ?>"><?php echo htmlspecialchars($t['team_name']); ?></option>
                <?php endforeach; ?>
            </select>
        </label>
        <label>Away:
            <select name="team_away_id">
                <?php foreach ($teams as $t): ?>
                    <option value="<?php echo $t['id']; ?>"><?php echo htmlspecialchars($t['team_name']); ?></option>
                <?php endforeach; ?>
            </select>
        </label>
        <label>Score Home: <input type="number" name="score_home" value="0" style="width:70px"></label>
        <label>Score Away: <input type="number" name="score_away" value="0" style="width:70px"></label>
        <label>Date (YYYY-MM-DD HH:MM:SS): <input type="text" name="match_date" value="<?php echo date('Y-m-d H:i:00'); ?>"></label>
        <label>Status:
            <select name="match_status">
                <option value="scheduled">scheduled</option>
                <option value="ongoing">ongoing</option>
                <option value="finished">finished</option>
            </select>
        </label>
        <button type="submit">Add</button>
    </form>

    <h3>Existing Matches</h3>
    <table>
        <thead><tr><th>ID</th><th>Home</th><th>Away</th><th>Score</th><th>Date</th><th>Status</th><th>Actions</th></tr></thead>
        <tbody>
        <?php foreach ($matches as $m): ?>
            <tr>
                <td><?php echo $m['id']; ?></td>
                <td><?php echo htmlspecialchars($m['home_name'] ?? ('#'.$m['team_home_id'])); ?></td>
                <td><?php echo htmlspecialchars($m['away_name'] ?? ('#'.$m['team_away_id'])); ?></td>
                <td><?php echo intval($m['score_home']).' - '.intval($m['score_away']); ?></td>
                <td><?php echo $m['match_date']; ?></td>
                <td><?php echo $m['match_status']; ?></td>
                <td>
                    <form method="post" style="display:inline">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<?php echo $m['id']; ?>">
                        <button type="submit" onclick="return confirm('Delete match <?php echo $m['id']; ?>?')">Delete</button>
                    </form>
                    <button onclick="fillEdit(<?php echo htmlspecialchars(json_encode($m)); ?>)">Edit</button>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>

    <div id="editModal" style="display:none;position:fixed;left:50%;top:50%;transform:translate(-50%,-50%);background:white;padding:16px;border:1px solid #ccc;box-shadow:0 8px 30px rgba(0,0,0,0.2)">
        <h3>Edit Match</h3>
        <form method="post" id="editForm">
            <input type="hidden" name="action" value="save">
            <input type="hidden" name="id" id="edit_id">
            <label>Home:
                <select name="team_home_id" id="edit_home">
                    <?php foreach ($teams as $t): ?>
                        <option value="<?php echo $t['id']; ?>"><?php echo htmlspecialchars($t['team_name']); ?></option>
                    <?php endforeach; ?>
                </select>
            </label>
            <label>Away:
                <select name="team_away_id" id="edit_away">
                    <?php foreach ($teams as $t): ?>
                        <option value="<?php echo $t['id']; ?>"><?php echo htmlspecialchars($t['team_name']); ?></option>
                    <?php endforeach; ?>
                </select>
            </label>
            <label>Score Home: <input type="number" name="score_home" id="edit_sh" value="0"></label>
            <label>Score Away: <input type="number" name="score_away" id="edit_sa" value="0"></label>
            <label>Date: <input type="text" name="match_date" id="edit_date"></label>
            <label>Status:
                <select name="match_status" id="edit_status">
                    <option value="scheduled">scheduled</option>
                    <option value="ongoing">ongoing</option>
                    <option value="finished">finished</option>
                </select>
            </label>
            <div style="margin-top:10px">
                <button type="submit">Save</button>
                <button type="button" onclick="document.getElementById('editModal').style.display='none'">Cancel</button>
            </div>
        </form>
    </div>

    <script>
    function fillEdit(data) {
        document.getElementById('edit_id').value = data.id;
        document.getElementById('edit_home').value = data.team_home_id;
        document.getElementById('edit_away').value = data.team_away_id;
        document.getElementById('edit_sh').value = data.score_home;
        document.getElementById('edit_sa').value = data.score_away;
        document.getElementById('edit_date').value = data.match_date;
        document.getElementById('edit_status').value = data.match_status;
        document.getElementById('editModal').style.display = 'block';
    }
    </script>
</body>
</html>
