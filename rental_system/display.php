<?php
include('db_connection.php');
$message = "";

// Fetch all student records
$sql = "SELECT * FROM studentinfo";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html>
<head>
  <title>View Students | T1 Device Rentals</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <style>
    table {
      margin: 0 auto;
      border-collapse: collapse;
      width: 90%;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      background-color: #f9f9f9;
    }
    th, td {
      padding: 12px 15px;
      text-align: center;
      border: 1px solid #ddd;
    }
    th {
      background-color: #007bff;
      color: white;
      font-weight: bold;
    }
    tr:nth-child(even) {
      background-color: #f2f2f2;
    }
    tr:hover {
      background-color: #e0f3ff;
    }
  </style>
</head>
<body>

<div class="header">
  <img src="images/laptop_logo.png" alt="T1 Device Rentals Logo">
  <h1>T1 Device Rentals</h1>
  <p>COMP 3395 Final Project | Spring 2025</p>
</div>

<main>
  <div class="form-container">
    <h2>Student Records</h2>
    <table>
      <thead>
        <tr>
          <th>Student ID</th>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Student Balance</th>
          <th>Admin Comments</th>
          <th>Outstanding Balance</th>
          <th>Is Registered</th>
          <th>Is Attending</th>
          <th>Number of Damages</th>
          <th>Can Rent</th>
          <th>Current Device</th>
        </tr>
      </thead>
      <tbody>
        <?php
        if ($result && $result->num_rows > 0) {
          while($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>{$row['StudentID']}</td>";
            echo "<td>{$row['FirstName']}</td>";
            echo "<td>{$row['LastName']}</td>";
            echo "<td>{$row['StudentBal']}</td>";
            echo "<td>{$row['AdminComments']}</td>";
            echo "<td>{$row['OutstandingBal']}</td>";
            echo "<td>{$row['isRegistered']}</td>";
            echo "<td>{$row['isAttending']}</td>";
            echo "<td>{$row['numDamages']}</td>";
            echo "<td>{$row['canRent']}</td>";
            echo "<td>{$row['currentDevice']}</td>";
            echo "</tr>";
          }
        } else {
          echo "<tr><td colspan='11'>No student records found.</td></tr>";
        }
        ?>
      </tbody>
    </table>
    <div class="form-buttons">
      <a href="index.php" class="button">← Back to Homepage</a>
    </div>
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
