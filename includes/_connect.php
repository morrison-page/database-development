<?php
$server ="plesk.remote.ac";
$username = "ws344889_dd_user";
$password = "ij&9f53P3";
// ========================== TASK 1
$database = "ws344889_dd";
// ========================== TASK 1
$connect = mysqli_connect($server,$username,$password,$database);


function runAndCheckSQL($connection, $sql){
    $run = mysqli_query($connection, $sql);
    if ($run) {
        if(is_array($run) || is_object($run)){
            return $run;
        }else{
            return true;
        }
    } else {
        die(showError($sql, $connection));
    }
}

function showError($sql, $connection){
    echo "<div class=\"alert alert-danger\"><strong>ERROR!</strong> : " .  $sql . "<br>" . mysqli_error($connection)."</div>";
}
?>
