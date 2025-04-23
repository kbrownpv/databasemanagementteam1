<?php
include('db_connection.php');
$result = $conn->query("SELECT * FROM studentinfo");
?>
<!DOCTYPE html>
<html>
<head>
  <title>Display Students</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h2>All Student Records</h2>
<table>
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
  <?php while (\$row = \$result->fetch_assoc()): ?>
  <tr>
    <td><?= \$row['StudentID'] ?></td>
    <td><?= \$row['FirstName'] ?></td>
    <td><?= \$row['LastName'] ?></td>
    <td><?= \$row['StudentBal'] ?></td>
    <td><?= \$row['AdminComments'] ?></td>
    <td><?= \$row['OutstandingBal'] ?></td>
    <td><?= \$row['isRegistered'] ?></td>
    <td><?= \$row['isAttending'] ?></td>
    <td><?= \$row['numDamages'] ?></td>
    <td><?= \$row['canRent'] ?></td>
    <td><?= \$row['currentDevice'] ?></td>
  </tr>
  <?php endwhile; ?>
</table>

<a href="index.php"><button> Back to Homepage</button></a>

</body>
</html>