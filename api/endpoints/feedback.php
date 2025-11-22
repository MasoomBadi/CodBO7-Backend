<?php
/**
 * Feedback Endpoint
 * POST /api/feedback - Submit user feedback
 */

// Only allow POST requests
if ($requestMethod !== 'POST') {
    Response::error('Method not allowed. Use POST.', 405);
    exit;
}

// Get JSON input
$input = json_decode(file_get_contents('php://input'), true);

// Validate input
if (!$input || !isset($input['message']) || empty(trim($input['message']))) {
    Response::error('Feedback message is required', 400);
    exit;
}

$message = trim($input['message']);

// Insert feedback into database
try {
    $stmt = $db->prepare("INSERT INTO feedback (message) VALUES (:message)");
    $stmt->execute(['message' => $message]);

    $feedbackId = $db->lastInsertId();

    Response::success([
        'id' => (int)$feedbackId
    ], 'Feedback submitted successfully', 201);
} catch (PDOException $e) {
    Response::error('Failed to submit feedback', 500);
}
