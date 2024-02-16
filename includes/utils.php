<?php

function showRadiationBadge($radiation_exposure){
    $class = "badge-success";
    $level = $radiation_exposure;
    if($level <= 50){
        $class = "badge-info";
    }else if($level <= 75){
        $class = "badge-warning";
    }else{
        $class = "badge-danger";
    }
    return "<i class=\"fas fa-radiation text-warning\"></i> <span class=\"badge badge-pill $class\">$level</span>";
}


function showWorkTable($week, $day, $connect){
    // ========================== Task 3
    //
    // Required SELECTS
    // - work_schedule.id - alias - work_schedule_id
    // - staff.first_name
    // - staff.last_name
    // - staff.clearance_level - alias - staff_clearance_level
    // - job.name - alias - job_name
    // - job.radiation_exposure
    // - location.name - alias - location_name
    // - location.required_clearance_level
    //
    // SELECT conditions are based on work_schedule.week_id and work_schedule.day_id
    //
    $sql = "SELECT 
                ws.id AS work_schedule_id, 
                s.first_name, 
                s.last_name, 
                s.clearance_level AS staff_clearance_level, 
                j.name AS job_name, 
                j.radiation_exposure, 
                l.name AS location_name, 
                l.required_clearance_level
            FROM
                work_schedule ws 
            JOIN 
                staff s ON ws.staff_id = s.id
            JOIN
                job j ON ws.job_id = j.id
            JOIN
                location l ON ws.location_id = l.id
            WHERE
                ws.week_id = $week AND ws.day_id = $day;
            ";    
    // ========================== /Task 3

    $run = runAndCheckSQL($connect,$sql);
?>
<table class="table table-striped table-dark">
    <thead class="thead-dark">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Firstname</th>
            <th scope="col">Lastname</th>
            <th scope="col">Job</th>
            <th scope="col">Radiation Exposure</th>
            <th scope="col">Location</th>
            <th scope="col">Clearance</th>
            <th scope="col"></th>
        </tr>
    </thead>
    <tbody>
        <?php 
        $x = 1;
        while($row=mysqli_fetch_assoc($run)) { 
            $first_name = $row["first_name"];
            $last_name = $row["last_name"];
            $job_name = $row['job_name'];
            $radiation_exposure = $row["radiation_exposure"];
            $location_name = $row["location_name"];
            $staff_clearance_level = $row["staff_clearance_level"];
            $required_clearance_level = $row["required_clearance_level"];
            $work_schedule_id = $row['work_schedule_id'];
            $row_class = $week.'_'.$day.'_'.$x;
        ?>
        <tr class="<?php echo $row_class;?>">
            <td>
                <?php echo $x;?>
            </td>
            <td>
                <?php echo $first_name;?>
            </td>
            <td>
                <?php echo $last_name;?>
            </td>
            <td>
                <?php echo $job_name;?>
            </td>
            <td>
                <?php echo showRadiationBadge($radiation_exposure);?>
            </td>
            <td>
                <?php echo $location_name;?>
            </td>
            <td>
                <?php 
                                                    
                    $clear = ($staff_clearance_level >= $required_clearance_level);
                    if($clear){
                        echo '<span class="badge badge-pill badge-success">Accepted</span>';
                    }else{
                        echo '<span class="badge badge-pill badge-danger">Denied</span>';
                    }
                ?>
            </td>
            <td>
                <a href="edit_job_appointment.php?appointment_id=<?php echo $work_schedule_id;?>"><i class="fas fa-edit btn-fa" data-toggle="tooltip" data-placement="top" title="Edit Job Appointment"></i></a>
                <i class="fas fa-trash-alt btn-fa" data-toggle="tooltip" data-placement="top" title="Delete Job Appointment: <?php echo $work_schedule_id;?>" data-row_class="<?php echo $row_class;?>" data-work_schedule_id="<?php echo $work_schedule_id;?>"></i>
            </td>
        </tr>

        <?php 
        $x++;
        };  ?>
    </tbody>
</table>
<div><a href="appoint_job.php?week=<?php echo $week;?>&day=<?php echo $day;?>" class="btn btn-primary btn-sm">+ Appoint Job</a></div>
<?php
}

function selectAllStaff($connect){
    // ========================== Part 6
    //
    // Required SELECTS
    // - staff.id
    // - staff.first_name
    // - staff.last_name
    // - staff.clearance_level
    //
    // Make sure to ORDER BY staff.clearance_level ASC
    //
    $staff_sql = "SELECT 
                    s.id, 
                    s.first_name, 
                    s.last_name, 
                    s.clearance_level 
                FROM 
                    staff s
                ORDER BY 
                    s.clearance_level 
                ASC
                ";
    // ========================== /Part 6

    return runAndCheckSQL($connect, $staff_sql); 
}


function selectAllJobsAndLocations($connect){
    // ========================== Part 7
    //
    // Required SELECTS
    // - job.id - alias - job_id
    // - job.name - alias - job_name
    // - job.radiation_exposure
    // - location.name - alias - location
    // - location.required_clearance_level
    //
    // Make sure to ORDER BY location.required_clearance_level ASC
    //
    $job_sql = "SELECT 
                    j.id AS job_id, 
                    j.name AS job_name, 
                    j.radiation_exposure, 
                    l.name AS location, 
                    l.required_clearance_level 
                FROM 
                    job j 
                JOIN 
                    location l ON j.location_id = l.id 
                ORDER BY 
                    l.required_clearance_level 
                ASC";
    // ========================== /Part 7
    return runAndCheckSQL($connect, $job_sql);
}


function selectAllWeeks($connect){
    // ========================== Part 8
    //
    // Required SELECTS
    // - weeks.id
    // - weeks.week_starts
    // - weeks.week_ends
    //
    // Make sure to ORDER BY weeks.id ASC
    //
    $week_sql = "SELECT 
                    w.id, 
                    w.week_starts, 
                    w.week_ends 
                FROM 
                    weeks w 
                ORDER BY 
                    w.id 
                ASC";
    // ========================== /Part 8
    return runAndCheckSQL($connect, $week_sql);
}

function selectAllDays($connect){
    // ========================== Part 9
    //
    // Required SELECTS
    // - days.id
    // - days.day
    //
    // Make sure to ORDER BY days.id ASC
    //
    $day_sql = "SELECT 
                    d.id, 
                    d.day 
                FROM 
                    days d 
                ORDER BY 
                    d.id 
                ASC";
    // ========================== /Part 9
    return runAndCheckSQL($connect, $day_sql);
}

function selectASingleWorkSchedule($connect, $id){
    // ========================== Part 12
    //
    // Required SELECTS
    // - work_schedule.week_id
    // - work_schedule.day_id
    // - work_schedule.job_id
    // - work_schedule.staff_id
    //
    // USE the php variable $id in the WHERE clause
    //
    $appointed_sql = "SELECT 
                        ws.week_id, 
                        ws.day_id, 
                        ws.job_id, 
                        ws.staff_id 
                    FROM 
                        work_schedule ws
                    WHERE 
                        ws.id = $id";
    // ========================== /Part 12
    return runAndCheckSQL($connect, $appointed_sql);
}