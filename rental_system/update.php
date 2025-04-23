<?php
include('db_connection.php');
<p><?= $message ?></p>
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['studentID'];
    $first = $_POST['firstName'];
    $last = $_POST['lastName'];
    $sql = "UPDATE studentinfo SET FirstName='$first', LastName='$last' WHERE StudentID='$id'";
    $message = $conn->query($sql) ? " Record updated successfully!" : " Error: " . $conn->error;
}
?>

<!DOCTYPE html>
<html>
<head>
  <title>Update Student</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h2>Update Student Info</h2>
<p><?= \$message ?></p>
<form action="update.php" method="post">
  Student ID: <input type="text" name="studentID"><br>
  New First Name: <input type="text" name="firstName"><br>
  New Last Name: <input type="text" name="lastName"><br>
  <input type="submit" value="Update">
</form>

<a href="index.php"><button> Back to Homepage</button></a>

</body>
</html>