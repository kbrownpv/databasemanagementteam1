<?php
include('db_connection.php');
<p><?= $message ?></p>
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['studentID'];
    $sql = "DELETE FROM studentinfo WHERE StudentID='$id'";
    $message = $conn->query($sql) ? " Record deleted successfully!" : " Error: " . $conn->error;
}
?>

<!DOCTYPE html>
<html>
<head>
  <title>Delete Student</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h2>Delete Student</h2>
<p><?= \$message ?></p>
<form action="delete.php" method="post">
  Student ID to Delete: <input type="text" name="studentID"><br>
  <input type="submit" value="Delete">
</form>

<a href="index.php"><button> Back to Homepage</button></a>

</body>
</html>