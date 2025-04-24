<?php
include('db_connection.php');
$message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['studentID'];
    $first = $_POST['firstName'];
    $last = $_POST['lastName'];
    $sql = "INSERT INTO studentinfo (StudentID, FirstName, LastName) VALUES ('$id', '$first', '$last')";
    $message = $conn->query($sql) ? " Record inserted successfully!" : " Error: " . $conn->error;
}
?>
<!DOCTYPE html>
<html>
<head>
  <title>Insert New Student | T1 Device Rentals</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<div class="header">
  <img src="images/laptop_logo.png" alt="T1 Device Rentals Logo">
  <h1>T1 Device Rentals</h1>
  <p>COMP 3395 Final Project | Spring 2025</p>
</div>

<div class="form-container">
  <h2>Insert New Student</h2>
  <p><?= $message ?></p>
  <form action="insert.php" method="post">
    <div class="form-group">
      <label for="studentID">Student ID:</label>
      <input type="text" name="studentID" required>
    </div>
    <div class="form-group">
      <label for="firstName">First Name:</label>
      <input type="text" name="firstName" required>
    </div>
    <div class="form-group">
      <label for="lastName">Last Name:</label>
      <input type="text" name="lastName" required>
    </div>
    <div class="form-buttons">
      <input type="submit" value="Insert">
      <a href="index.php" class="button">← Back to Homepage</a>
    </div>
  </form>
</div>

<div class="team">
  <p><strong>Team Members:</strong> Kendall Brown, Karrington Hall, Brandon Nobles, Sarah Lamar, Lemikkos Starks</p>
</div>

<footer>
  &copy; 2025 T1 Device Rentals | All Rights Reserved
</footer>

</body>
</html>