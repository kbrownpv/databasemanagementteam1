<?php
include('db_connection.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $studentID = $_POST['studentID'];

    $sql = "DELETE FROM StudentInfo WHERE studentID='$studentID'";

    if ($conn->query($sql) === TRUE) {
        echo "Record deleted successfully!";
    } else {
        echo "Error deleting record: " . $conn->error;
    }
}
?>

<h2>Delete Student</h2>
<form method="post" action="">
    Student ID to Delete: <input type="text" name="studentID"><br><br>
    <input type="submit" value="Delete">
</form>

<br><br>
<a href="index.php">
    <button style="padding: 10px 20px; font-size: 16px;"> Back to Home</button>
</a>
