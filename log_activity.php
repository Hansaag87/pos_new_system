<?php
function log_activity($pdo, $action, $details, $user_id = null) {
    if ($user_id === null && isset($_SESSION['user_id'])) $user_id = $_SESSION['user_id'];
    $stmt = $pdo->prepare("INSERT INTO activity_logs (user_id, action, details) VALUES (?, ?, ?)");
    $stmt->execute([$user_id, $action, $details]);
}