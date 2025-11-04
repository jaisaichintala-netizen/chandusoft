<?php
require_once __DIR__ . '/../app/config.php';
require_once __DIR__ . '/../app/logger.php';

$order_id = intval($_GET['order_id'] ?? 0);

if ($order_id) {
    $pdo->prepare("UPDATE orders SET payment_status='failed' WHERE id=?")->execute([$order_id]);
    log_catalog("Payment canceled for order $order_id");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Payment Canceled</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        text-align: center;
        padding: 50px;
    }
    h2 {
        color: #dc3545;
        margin-bottom: 20px;
    }
    a {
        display: inline-block;
        margin-top: 20px;
        background-color: #007BFF;
        color: #fff;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 6px;
        transition: 0.3s;
    }
    a:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>

<h2>❌ Payment canceled. Please try again or choose a different method.</h2>
<a href="/public/catalog">Back to Shop</a>

</body>
</html>
