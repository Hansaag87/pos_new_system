<?php
session_start();
if (!isset($_SESSION['user_id'], $_SESSION['role'])) {
    http_response_code(403); exit;
}
require_once 'C:\inetpub\wwwroot\pos_new\db.php';

// Filters
$from   = $_GET['from'] ?? '';
$to     = $_GET['to'] ?? '';
$user   = $_GET['user'] ?? '';
$action = $_GET['action'] ?? '';
$page   = max(1, intval($_GET['page'] ?? 1));
$perPage = 25;

$w = [];
$params = [];
if ($from)    { $w[] = "a.timestamp >= ?"; $params[] = $from." 00:00:00"; }
if ($to)      { $w[] = "a.timestamp <= ?"; $params[] = $to." 23:59:59"; }
if ($user)    { $w[] = "a.user_id = ?";    $params[] = $user; }
if ($action)  { $w[] = "a.action = ?";     $params[] = $action; }
$where = $w ? "WHERE ".implode(" AND ", $w) : "";

$total = $pdo->prepare("SELECT COUNT(*) FROM activity_logs a $where");
$total->execute($params);
$count = $total->fetchColumn();
$pages = ceil($count / $perPage);
$offset = ($page-1)*$perPage;

$sql = "SELECT a.*, u.username FROM activity_logs a LEFT JOIN users u ON a.user_id=u.id $where ORDER BY a.timestamp DESC LIMIT $perPage OFFSET $offset";
$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<table class="min-w-full text-xs">
  <thead>
    <tr class="bg-gray-100 font-bold">
      <th class="px-2 py-2">#</th>
      <th class="px-2 py-2">Timestamp</th>
      <th class="px-2 py-2">User</th>
      <th class="px-2 py-2">Action</th>
      <th class="px-2 py-2">Details</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach($rows as $i=>$r): ?>
      <tr class="<?= $i%2==0?'bg-white':'bg-gray-50' ?>">
        <td class="px-2 py-1"><?= ($offset+$i+1) ?></td>
        <td class="px-2 py-1"><?= htmlspecialchars($r['timestamp']) ?></td>
        <td class="px-2 py-1"><?= htmlspecialchars($r['username']??'System') ?></td>
        <td class="px-2 py-1"><?= htmlspecialchars(ucfirst(str_replace('_',' ', $r['action']))) ?></td>
        <td class="px-2 py-1"><?= nl2br(htmlspecialchars($r['details'])) ?></td>
      </tr>
    <?php endforeach; ?>
    <?php if(!$rows): ?>
      <tr><td colspan="5" class="text-center p-4 text-gray-500">No logs found.</td></tr>
    <?php endif; ?>
  </tbody>
</table>
<?php if($pages > 1): ?>
  <div class="mt-3 flex gap-2">
    <?php for($p=1;$p<=$pages;$p++): ?>
      <button onclick="loadLogs(<?= $p ?>)" class="px-2 py-1 rounded <?= $p==$page?'bg-blue-600 text-white':'bg-gray-200' ?>"><?= $p ?></button>
    <?php endfor; ?>
  </div>
<?php endif; ?>