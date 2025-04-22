<?php
include('db_connection.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $studentID = $_POST['studentID'];
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];

    $sql = "INSERT INTO studentinfo (StudentID, FirstName, LastName)
            VALUES ('$studentID', '$firstName', '$lastName')";

    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
?>

<h2>Insert New Student</h2>
<form method="post" action="">
    Student ID: <input type="text" name="studentID" required><br><br>
    First Name: <input type="text" name="firstName" required><br><br>
    Last Name: <input type="text" name="lastName" required><br><br>
    <input type="submit" value="Insert">
</form>

<br><br>
<a href="index.php">
    <button style="padding: 10px 20px; font-size: 16px;"> Back to Home</button>
</a>
