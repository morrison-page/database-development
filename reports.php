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
    This is a pie chart which displays total jobs per area 
    which is meant to show what area is having the most work done in.
</p>

<?php
$sql = "SELECT
    l.name,
    COUNT(ws.id) AS jobs_per_area
FROM
    work_schedule ws
LEFT JOIN location l ON
    l.id = ws.location_id
GROUP BY
    location_id;";

$run = runAndCheckSQL($connect, $sql);

$results = [];
while ($row = mysqli_fetch_assoc($run)) {
    $results[] = $row;
}

$labels = [];
$data = [];
foreach ($results as $row) {
    $labels[] = $row['name'];
    $data[] = $row['jobs_per_area'];
}

$labels_json = json_encode($labels);
$data_json = json_encode($data);
?>

<canvas id="pieChart"></canvas>
    <script>
        var labels = <?php echo $labels_json; ?>;
        var data = <?php echo $data_json; ?>;
        
        var ctx = document.getElementById('pieChart').getContext('2d');
        var myPieChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Jobs per Area',
                    data: data,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.5)',
                        'rgba(54, 162, 235, 0.5)',
                        'rgba(255, 206, 86, 0.5)',
                        'rgba(75, 192, 192, 0.5)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)'
                    ],
                    borderWidth: 1
                }]
            }
        });
    </script>

<!-- ====================================================== -->
<!-- Quantity of Each Job Type Carried Out Bar Chart -->
<!-- ====================================================== -->
<h3 class="mx-md mt-5">Quantity of Each Job Type Carried Out</h3>

<p>
    This is a bar chart visualisation on the quantity of jobs which are planned
    or completed seperated into job type to identify the most frequent jobs.
</p>

<?php
$sql = "SELECT
    j.name AS job_name,
    COUNT(ws.job_id) AS jobs_count
FROM
    job j
LEFT JOIN work_schedule ws ON
    j.id = ws.job_id
GROUP BY
    j.name;";

$run = runAndCheckSQL($connect, $sql);

$results = [];
while ($row = mysqli_fetch_assoc($run)) {
    $results[] = $row;
}

$labels = [];
$data = [];
foreach ($results as $row) {
    $labels[] = $row['job_name'];
    $data[] = $row['jobs_count'];
}

$labels_json = json_encode($labels);
$data_json = json_encode($data);
?>

<canvas id="barChart" width="400" height="400"></canvas>
    <script>
        // Retrieve data from PHP variables
        var labels = <?php echo $labels_json; ?>;
        var data = <?php echo $data_json; ?>;
        
        // Create bar chart
        var ctx = document.getElementById('barChart').getContext('2d');
        var myBarChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Jobs Count',
                    data: data,
                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>

<!-- ====================================================== -->
<!-- PAGE CONTENT ENDS HERE -->
<!-- ====================================================== -->

<?php include_once("includes/footer.php"); ?>
