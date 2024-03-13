<?php
include_once("includes/_connect.php");
include_once("includes/header.php");
include_once("includes/nav.php");
include_once("includes/utils.php");
?>

<!-- ====================================================== -->
<!-- PAGE CONTENT STARTS HERE -->
<!-- ====================================================== -->

<h2 class="mx-md mt-5">Power Station Report Page</h2>

<!-- ====================================================== -->
<!-- Privilaged User Review Table -->
<!-- ====================================================== -->
<h3 class="mx-md mt-5">Privilaged User Review</h3>

<p>
    This table displays the quantity (up to 3) jobs that require elevated access that users with
    elevated access have completed and is supposed outline the people who are not using their
    high clearance so then it can be reduced later to enhance security.
</p>

<?php
$sql = "SELECT
    s.id AS staff_id,
    s.first_name,
    s.last_name,
    s.clearance_level,
    COUNT(ws.id) AS high_access_job_count
FROM
    staff s
LEFT JOIN work_schedule ws ON
    s.id = ws.staff_id
WHERE
location_id IN (
    SELECT
        id AS location_id
    FROM
        location l
    WHERE
        l.required_clearance_level BETWEEN 3 AND 5
)
GROUP BY
    s.id,
    s.first_name,
    s.last_name,
    s.clearance_level
HAVING
    COUNT(ws.id) BETWEEN 0 AND 3;";

$run = runAndCheckSQL($connect, $sql);
?>

<table class="table table-striped table-dark">
    <thead class="thead-dark">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Firstname</th>
            <th scope="col">Lastname</th>
            <th scope="col">Clearance Level</th>
            <th scope="col">Jobs that Required Elevated Access</th>
        </tr>
    </thead>
    <tbody>
        <?php
        while ($row = mysqli_fetch_assoc($run))
        {
            echo '<tr>';
            echo '<td>', $row['staff_id'],'</td>';
            echo '<td>', $row['first_name'],'</td>';
            echo '<td>', $row['last_name'],'</td>';
            echo '<td>', $row['clearance_level'],'</td>';
            echo '<td>', $row['high_access_job_count'],'</td>';
            echo '<tr>';
        };
        ?>
    </tbody>
</table>

<!-- ====================================================== -->
<!-- Percentage of Total Jobs per Area Pie Chart -->
<!-- ====================================================== -->
<h3 class="mx-md mt-5">Percentage of Total Jobs per Area</h3>

<p>
    This is a pie chart which displays a percentage of total jobs per area 
    which is meant to show what area is having the most work done in.
</p>



<?php

?>

<!-- ====================================================== -->
<!-- Quantity of Each Job Type Carried Out Bar Chart -->
<!-- ====================================================== -->
<h3 class="mx-md mt-5">Quantity of Each Job Type Carried Out</h3>



<!-- ====================================================== -->
<!-- PAGE CONTENT ENDS HERE -->
<!-- ====================================================== -->

<?php include_once("includes/footer.php"); ?>
