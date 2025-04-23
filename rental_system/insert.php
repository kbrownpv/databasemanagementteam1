<?php
include('db_connection.php');
<p><?= $message ?></p>

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
  <title>Insert Student</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h2>Insert New Student</h2>
<p><?= \$message ?></p>
<form action="insert.php" method="post">
  Student ID: <input type="text" name="studentID"><br>
  First Name: <input type="text" name="firstName"><br>
  Last Name: <input type="text" name="lastName"><br>
  <input type="submit" value="Insert">
</form>

<a href="index.php"><button> Back to Homepage</button></a>

</body>
</html>