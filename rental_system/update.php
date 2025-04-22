<?php
include('db_connection.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $studentID = $_POST['studentID'];
    $newFirstName = $_POST['firstName'];
    $newLastName = $_POST['lastName'];

    $sql = "UPDATE studentinfo 
            SET FirstName='$newFirstName', LastName='$newLastName' 
            WHERE StudentID='$studentID'";

    if ($conn->query($sql) === TRUE) {
        echo "Record updated successfully!";
    } else {
        echo "Error updating record: " . $conn->error;
    }
}
?>

<h2>Update Student Information</h2>
<form method="post" action="">
    Student ID to Update: <input type="text" name="studentID" required><br><br>
    New First Name: <input type="text" name="firstName" required><br><br>
    New Last Name: <input type="text" name="lastName" required><br><br>
    <input type="submit" value="Update Student">
</form>

<br><br>
<a href="index.php">
    <button style="padding: 10px 20px; font-size: 16px;"> Back to Home</button>
</a>

