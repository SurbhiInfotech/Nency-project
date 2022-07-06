<?php
session_start();
$con= new mysqli("localhost","u303366101_luthara","Luthara@123","u303366101_luthara");
// check connection
if(mysqli_connect_error())
{
	die("Connection Fail!". mysqli_connect_error());    
}

print_r($_SESSION);
//$con->query("delete from student where sid > 7");
/*$data=$con->query("select * from student");  
while($row=mysqli_fetch_assoc($data))
{
    echo $row['sid'] . ' -- ' . $row['enrollno'] . ' -- '.$row['email'].' -- '.$row['password']."<br>";
}*/


//$data=$con->query("delete from company");die;
//$con->query("delete from company where cid>=70");die;
/*if (!$con->query("delete from company")) {
    echo "Error description: " . $con->error;
  }

  die;*/

/*$data=$con->query("select * from apply");  
while($row=mysqli_fetch_assoc($data))
{
    echo "<pre>";
    print_r($row);
    echo "</pre>";
}


/*$data=$con->query("select * from coodinater");  
while($row=mysqli_fetch_assoc($data))
{
    echo "<pre>";
    print_r($row);
    echo "</pre>";
}*/

/*$data=$con->query("select * from studprofile order by eid DESC");  
while($row=mysqli_fetch_assoc($data))
{
    echo "<pre>";
    print_r($row);
    echo "</pre>";
}*/

/*$data2=$con->query("select * from ugdetails");  
while($row2=mysqli_fetch_assoc($data2))
{
    echo "<pre>";
    print_r($row2);
    echo "</pre>";
}
die;*/

/*$data2=$con->query("select * from student");  
while($row2=mysqli_fetch_assoc($data2))
{
    echo "<pre>";
    print_r($row2);
    echo "</pre>";
}*/
$data2=$con->query("select * from coodinater");  
while($row2=mysqli_fetch_assoc($data2))
{
    echo "<pre>";
    print_r($row2);
    echo "</pre>";
}

?>