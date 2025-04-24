<?php
include('db_connection.php');
$message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['studentID'];
    $sql = "DELETE FROM studentinfo WHERE StudentID='$id'";
    $message = $conn->query($sql) ? "Record deleted successfully!" : "Error: " . $conn->error;
}
?>
<!DOCTYPE html>
<html>
<head>
  <title>Delete Student | T1 Device Rentals</title>
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
    <h2>Delete Student</h2>
    <p class="message"><?php echo $message; ?></p>
    <form action="delete.php" method="post">
      <div class="form-group">
        <label for="studentID">Student ID:</label>
        <input type="text" name="studentID" required>
      </div>
      <div class="form-buttons">
        <input type="submit" value="Delete" class="button">
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