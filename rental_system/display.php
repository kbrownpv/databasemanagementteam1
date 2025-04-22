<?php
include('db_connection.php');

$sql = "SELECT * FROM studentinfo";
$result = $conn->query($sql);
?>

<h2>All Students</h2>

<table border="1" cellpadding="10">
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

<?php
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["StudentID"] . "</td>";
        echo "<td>" . $row["FirstName"] . "</td>";
        echo "<td>" . $row["LastName"] . "</td>";
        echo "<td>" . $row["StudentBal"] . "</td>";
        echo "<td>" . $row["AdminComments"] . "</td>";
        echo "<td>" . $row["OutstandingBal"] . "</td>";
        echo "<td>" . $row["isRegistered"] . "</td>";
        echo "<td>" . $row["isAttending"] . "</td>";
        echo "<td>" . $row["numDamages"] . "</td>";
        echo "<td>" . $row["canRent"] . "</td>";
        echo "<td>" . $row["currentDevice"] . "</td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='11'>No students found</td></tr>";
}
?>

</table>

<br><br>
<a href="index.php">
    <button style="padding: 10px 20px; font-size: 16px;"> Back to Home</button>
</a>
