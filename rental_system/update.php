<?php
include('db_connection.php');
$message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['studentID'];
    $first = $_POST['firstName'];
    $last = $_POST['lastName'];
    $sql = "UPDATE studentinfo SET FirstName='$first', LastName='$last' WHERE StudentID='$id'";
    $message = $conn->query($sql) ? "Record updated successfully!" : "Error: " . $conn->error;
}
?>
<!DOCTYPE html>
<html>
<head>
  <title>Update Student | T1 Device Rentals</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<div class="header">
  <img src="images/laptop_logo.png" alt="T1 Device Rentals Logo">
  <h1>T1 Device Rentals</h1>
  <p>COMP 3395 Final Project | Spring 2025</p>
</div>

<main>
  <div class="form-container">
    <h2>Update Student</h2>
    <p class="message"><?= $message ?></p>
    <form action="update.php" method="post">
      <div class="form-group">
        <label for="studentID">Student ID:</label>
        <input type="text" name="studentID" required>
      </div>
      <div class="form-group">
        <label for="firstName">New First Name:</label>
        <input type="text" name="firstName" required>
      </div>
      <div class="form-group">
        <label for="lastName">New Last Name:</label>
        <input type="text" name="lastName" required>
      </div>
      <div class="form-buttons">
        <input type="submit" value="Update" class="button">
        <a href="index.php" class="button">← Back to Homepage</a>
      </div>
    </form>
  </div>
</main>

<div class="team">
  <p><strong>Team Members:</strong> Kendall Brown, Karrington Hall, Brandon Nobles, Sarah Lamar, Lemikkos Starks</p>
</div>

<footer>
  &copy; 2025 T1 Device Rentals | All Rights Reserved
</footer>

</body>
</html>