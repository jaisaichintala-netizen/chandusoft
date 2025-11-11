<?php
// =============================================================
// Chandusoft – Payment Success / Order Confirmation
// =============================================================
session_start();
require_once __DIR__ . '/../app/config.php';
require_once __DIR__ . '/../app/logger.php';

// -------------------------------------------------------------
// 1️⃣ Load order info
// -------------------------------------------------------------
$order_id = intval($_GET['order_id'] ?? 0);
$is_test_mode = isset($_GET['testmode']);

if ($order_id <= 0) {
    echo "<h3>⚠️ Invalid order ID.</h3>";
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM orders WHERE id = ?");
$stmt->execute([$order_id]);
$order = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$order) {
    echo "<h3>⚠️ Order not found.</h3>";
    exit;
}

$payment_method = $order['payment_gateway'];
$status = strtolower(trim($order['payment_status']));
$order_ref = $order['order_ref'] ?? 'N/A';

// -------------------------------------------------------------
// 2️⃣ Auto-update status for test or manual success confirmation
// -------------------------------------------------------------
if ($status === 'pending' && !$is_test_mode) {
    try {
        $update = $pdo->prepare("
            UPDATE orders
            SET payment_status = 'paid', updated_at = NOW()
            WHERE id = ? AND payment_status = 'pending'
        ");
        $update->execute([$order_id]);

        $status = 'paid';
        log_catalog("✅ Order #$order_id manually marked as PAID on success page.");
    } catch (Exception $e) {
        log_catalog("❌ Failed to update payment status for order #$order_id: " . $e->getMessage(), 'ERROR');
    }
} elseif ($status === 'pending' && $is_test_mode) {
    log_catalog("🧪 Test mode order #$order_id left as pending.");
}

// -------------------------------------------------------------
// 3️⃣ Prepare dynamic message
// -------------------------------------------------------------
$message = '';
if ($status === 'paid') {
    $message = "✅ Payment Successful! Your order #$order_id is confirmed and paid.";
} elseif ($status === 'failed') {
    $message = "❌ Payment Failed! Please try again or contact support.";
} else {
    $message = "🕒 Payment Pending! Order #$order_id is awaiting Stripe confirmation.";
}

// -------------------------------------------------------------
// 4️⃣ Render HTML
// -------------------------------------------------------------
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Order Confirmation</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 30px;
    }
    .container {
        max-width: 900px;
        margin: 0 auto;
        background: #fff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }
    h2 {
        color: <?php echo ($status === 'failed') ? '#dc3545' : (($status === 'pending') ? '#ffc107' : '#28a745'); ?>;
        text-align: center;
        margin-bottom: 25px;
    }
    h3 {
        color: #007BFF;
        margin-top: 20px;
    }
    p {
        font-size: 16px;
        line-height: 1.6;
        margin: 6px 0;
    }
    strong { color: #000; }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }
    th {
        background-color: #007BFF;
        color: #fff;
        padding: 12px;
        text-align: left;
    }
    td {
        padding: 12px;
        border-bottom: 1px solid #ddd;
    }
    tr:hover { background-color: #f1f1f1; }
    .back-link {
        display: inline-block;
        margin-top: 30px;
        background-color: #007BFF;
        color: #fff;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 6px;
        transition: 0.3s;
    }
    .back-link:hover { background-color: #0056b3; }
    @media (max-width: 768px) {
        body { padding: 15px; }
        .container { padding: 20px; }
        th, td { padding: 10px; }
    }
</style>
</head>
<body>

<div class="container">
    <h2><?= $message ?></h2>

    <h3>Order Details:</h3>
        <p><strong>Customer Name:</strong> <?= htmlspecialchars($order['customer_name']) ?></p>
        <p><strong>Order Reference:</strong> <?= htmlspecialchars($order_ref) ?></p>
        <p><strong>Payment Gateway:</strong> <?= htmlspecialchars($payment_method) ?></p>
        <p><strong>Total Amount:</strong> $<?= number_format($order['total'], 2) ?></p>
        <p><strong>Payment Status:</strong> <?= ucfirst($status) ?></p>

        <?php $txn_id = $order['txn_id'] ?? ''; ?>
        <p><strong>Transaction ID:</strong> <?= htmlspecialchars($txn_id ?: 'N/A') ?></p>

    <h3>Purchased Products:</h3>
    <table>
        <tr>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Subtotal</th>
        </tr>
        <?php
        $stmt_items = $pdo->prepare("SELECT * FROM order_items WHERE order_id = ?");
        $stmt_items->execute([$order_id]);
        $order_items = $stmt_items->fetchAll(PDO::FETCH_ASSOC);

        foreach ($order_items as $item) {
            $subtotal = $item['price'] * $item['quantity'];
            echo "<tr>
                    <td>" . htmlspecialchars($item['product_name']) . "</td>
                    <td>" . htmlspecialchars($item['quantity']) . "</td>
                    <td>$" . number_format($item['price'], 2) . "</td>
                    <td>$" . number_format($subtotal, 2) . "</td>
                  </tr>";
        }
        ?>
    </table>

    <a href="/public/catalog" class="back-link">Back to Shop</a>
</div>

</body>
</html>
