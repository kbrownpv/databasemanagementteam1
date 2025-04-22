<?php
$servername = "localhost"; // Assuming you're using XAMPP
$username = "root";        // Default username in XAMPP
$password = "";            // Default password (empty)
$database = "rental_system"; 

$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
