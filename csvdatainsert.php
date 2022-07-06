<?php
session_start();
//ini_set("display_errors",1);
//error_reporting(E_ALL);
header('Access-Control-Allow-Origin: *');
mb_internal_encoding("8bit");
$con= new mysqli("localhost","u303366101_luthara","Luthara@123","u303366101_luthara"); //Uncomment this when upload file to server
//$con= new mysqli("localhost","root","","placement1"); //Comment this when upload file to server
?>
<!doctype html>
<html lang="en">
 
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 
  <title>Import CSV File into MySQL using PHP</title>
 
  <style>
    .custom-file-input.selected:lang(en)::after {
      content: "" !important;
    }
 
    .custom-file {
      overflow: hidden;
    }
 
    .custom-file-input {
      white-space: nowrap;
    }
  </style>
</head>
 
<body>
 
  <div class="container">
    <form action="csvdatainsert.php" method="post" enctype="multipart/form-data">
      <div class="input-group">
        <div class="custom-file">
          <input type="file" class="custom-file-input" id="customFileInput" aria-describedby="customFileInput" name="file">
          <label class="custom-file-label" for="customFileInput">Select file</label>
        </div>
        <div class="input-group-append">
           <input type="submit" name="submit" value="Upload" class="btn btn-primary">
        </div>
      </div>
  </form>
  </div>
 
</body>
 
</html>

<?php
// include mysql database configuration file
//include_once 'db.php';
 
if (isset($_POST['submit']))
{
 
    // Allowed mime types
    $fileMimes = array(
        'text/x-comma-separated-values',
        'text/comma-separated-values',
        'application/octet-stream',
        'application/vnd.ms-excel',
        'application/x-csv',
        'text/x-csv',
        'text/csv',
        'application/csv',
        'application/excel',
        'application/vnd.msexcel',
        'text/plain'
    );
 
    // Validate whether selected file is a CSV file
    if (!empty($_FILES['file']['name']) && in_array($_FILES['file']['type'], $fileMimes))
    {
 
            // Open uploaded CSV file with read-only mode
            $csvFile = fopen($_FILES['file']['tmp_name'], 'r');
 
            // Skip the first line
            fgetcsv($csvFile);
 
            // Parse data from CSV file line by line
             // Parse data from CSV file line by line
            while (($getData = fgetcsv($csvFile, 10000, ",")) !== FALSE)
            {
              
              //print_r($getData);die;
                // Get row data
                $enrollno = $getData[0];
                $email = $getData[1];
                $password = $getData[2];
               
              if(trim($enrollno) != '' && trim($email) != '' && trim($password) != '') {
                // If user already exists in the database with the same email
                $data=$con->query("SELECT sid FROM student WHERE email = '" . $getData[1] . "'");
                  $row=mysqli_fetch_assoc($data);
               // $check = mysqli_query($con, $query);

                if ($row->num_rows > 0)
                {
                    $in=$con->query("UPDATE student SET enrollno = '" . $enrollno . "', password = '" . $password . "' WHERE email = '" . $email . "'");
                }
                else
                {
                     $in=$con->query("INSERT INTO student (enrollno, email, password) VALUES ('" . $enrollno . "', '" . $email . "', '" . $password . "')");
 
                }
              
              }
            }
 
            // Close opened CSV file
            fclose($csvFile);
            
            header("Location: csvdatainsert.php?status=done");
              //?status=done");

         
    }
    else
    {
        echo "Please select valid file";
    }
}
if($_GET['status']=='done'){
  echo "Insert CSV FILE Successfully in DataBase.";
}
