<?php
// db_connection.php should be included in every file where DB interaction happens
include('db_connection.php');
?>

<!DOCTYPE html>
<html>
<head>
  <title>Rental System Homepage</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<div style="text-align: center; margin-bottom: 20px;">
    <img src="images/LAPTOP RENTAL.png" alt="T1 Device Rentals Logo" style="height: 100px;">
    <h1 style="color:#007BFF; font-weight: bold; font-size: 2.2rem; margin-top: 10px;">T1 Device Rentals</h1>
    <p style="color: #555; font-size: 1rem;">COMP 3395 Final Project | Spring 2025</p>
</div>

<div style="text-align: center;">
    <a href="insert.php"><button class="nav-btn"> Insert</button></a>
    <a href="update.php"><button class="nav-btn"> Update</button></a>
    <a href="delete.php"><button class="nav-btn"> Delete</button></a>
    <a href="display.php"><button class="nav-btn"> Display</button></a>
</div>

<footer style="margin-top: 60px; font-size: 14px; color: #999; text-align: center;">
    &copy; 2025 T1 Device Rentals | All Rights Reserved
</footer>

</body>
</html>