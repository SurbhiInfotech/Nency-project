<?php
session_start();
ini_set("display_errors",1);
error_reporting(E_ALL);
header('Access-Control-Allow-Origin: *');
mb_internal_encoding("8bit");

//exec("mysqldump -u u303366101_luthara -p u303366101_luthara > my_database_dump.sql");
//shell_exec('mysqldump -h localhost -u u303366101_luthara -p Luthara@123 u303366101_luthara > dbname.sql');

//DOWNLOAD SERVER DB
/*$dbhost =   "localhost";
$dbuser =   "u303366101_luthara";
$dbpass =   "Luthara@123";
$dbname =   "u303366101_luthara";
exec("mysqldump --user=$dbuser --password='$dbpass' --host=$dbhost $dbname > DB.sql");
die; */
//DOWNLOAD SERVER DB






$con= new mysqli("localhost","u303366101_luthara","Luthara@123","u303366101_luthara");


/*exec('chmod 777 /home/u303366101/domains/codealphainfotech.com/public_html/luthara/uploads/test.xls')
exec('chown www-data.www-data /home/u303366101/domains/codealphainfotech.com/public_html/luthara/uploads/test.xls');
die;


$target_dir = "uploads/temp2.xls";
//chown($target_dir,'apache');
//chmod($target_dir,0777);
include 'excel_reader.php';
$excel = new PhpExcelReader;
$excel->read($target_dir);
function sheetData($sheet) {
    $re = '<table>';     // starts html table
  
    $x = 1;
    while($x <= $sheet['numRows']) {
      $re .= "<tr>\n";
      $y = 1;
      while($y <= $sheet['numCols']) {
        $cell = isset($sheet['cells'][$x][$y]) ? $sheet['cells'][$x][$y] : '';
        $re .= " <td>$cell</td>\n";  
        $y++;
      }  
      $re .= "</tr>\n";
      $x++;
    }
  
    return $re .'</table>';     // ends and returns the html table
  }
  
  $nr_sheets = count($excel->sheets);       // gets the number of sheets
  $excel_data = '';              // to store the the html tables with data of each sheet
  
  // traverses the number of sheets and sets html table with each sheet data in $excel_data
  for($i=0; $i<$nr_sheets; $i++) {
    $excel_data .= '<h4>Sheet '. ($i + 1) .' (<em>'. $excel->boundsheets[$i]['name'] .'</em>)</h4>'. sheetData($excel->sheets[$i]) .'<br/>';  
  }
  echo $excel_data;
  
die;




//echo $_SERVER['DOCUMENT_ROOT'];
//die;

$data=$con->query("select * from tendetails");  
while($row=mysqli_fetch_assoc($data))
{
    echo "<pre>";
    print_r($row);
    echo "</pre>";
}

/*$data=$con->query("select * from studprofile");  
    while($row=mysqli_fetch_assoc($data))
    {
        echo $row['email'] . ' == ' . $row['password'] . "<br>";
    }
die;*/
// check connection
/*if(mysqli_connect_error())
{
	die("Connection Fail!". mysqli_connect_error());
}
echo "hi";
$data=$con->query("select * from studprofile");  
while($row=mysqli_fetch_assoc($data))
{
    echo "<pre>";
    print_r($row);
    echo "</pre>";
}

$data2=$con->query("select * from tendetails");  
while($row2=mysqli_fetch_assoc($data2))
{
    echo "<pre>";
    print_r($row2);
    echo "</pre>";
}
die;*/



/*if($_REQUEST['what']=="importFile")
{
    //echo $_FILES['file_field']['name'];

    //$target_dir = "C:/Flutter/flutterproject/placement/uploads/";
    $target_dir = "/home/u303366101/domains/codealphainfotech.com/public_html/luthara/uploads/";
    $filename_array = explode(".",basename($_FILES["file_field"]["name"]));
    $target_file = $target_dir . $filename_array[0].'.xls';//basename($_FILES["file_field"]["name"]);
    //echo $target_file . " -- " . $_FILES["file_field"]["tmp_name"];
    $move = move_uploaded_file($_FILES["file_field"]["tmp_name"], $target_file);
   // chown($target_file,'www-data');
    // chmod($target_file,777);
    //echo '--'.$move.'--';die;
    if ($move) {


        echo "Uploaded";
      } else {
        echo "Sorry, there was an error uploading your file.";
      }
    die;
}*/

if($_REQUEST['what']=="getstudentdisplay")
{
    $data=$con->query("select * FROM student ");  
    while($row=mysqli_fetch_assoc($data))
    {
        //var cid=inserted_id();
       // $cid = $row['cid'];
        $key['student'][]=$row;
        //$cid = $key['cid'];
    }
    
    $json=json_encode($key);
    
    echo $json;
}


if($_REQUEST['what']=="student")
{
    $in=$con->query("insert into student values(0,'211','nency@gmail.com','123')"); 
}


//10details
if($_REQUEST['what']=="student10details")
{
    $in=$con->query("insert into studtendetails values(0,'$_REQUEST[sid]','$_REQUEST[tpassingyear]','$_REQUEST[tcgpi]','$_REQUEST[tpercentage]','$_REQUEST[tclass]','$_REQUEST[tspecialization]','$_REQUEST[tschoolname]','$_REQUEST[tschooladd]','$_REQUEST[tschoolcity]','$_REQUEST[tschoolpincode]','$_REQUEST[tboard]','$_REQUEST[tanygap]','$_REQUEST[tgapyear]')"); 
}

if($_REQUEST['what']=="gettendetails")
{
    //echo "select * from tendetails where eid in(select eid from studprofile where eid = '$_REQUEST[eid]')";die;
    $data=$con->query("select * from studtendetails where sid in(select sid from student where sid = '$_REQUEST[sid]')");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
    }
    
    $json=json_encode($key);
    
    echo $json;
}

if($_REQUEST['what']=="edit10details")
{
    $in=$con->query("update studtendetails set tpassingyear='$_REQUEST[tpassingyear]',tcgpi='$_REQUEST[tcgpi]',tpercentage='$_REQUEST[tpercentage]',tclass='$_REQUEST[tclass]',tspecialization='$_REQUEST[tspecialization]',tschoolname='$_REQUEST[tschoolname]',tschooladd='$_REQUEST[tschooladd]',tschoolcity='$_REQUEST[tschoolcity]',tschoolpincode='$_REQUEST[tschoolpincode]',tboard='$_REQUEST[tboard]',tanygap='$_REQUEST[tanygap]',tgapyear='$_REQUEST[tgapyear]' where sid='$_REQUEST[sid]'");
   
}
//10deatilsover

//postgraduation
if($_REQUEST['what']=="studpg")
{
    $in=$con->query("insert into studpostgraduation values(0,'$_REQUEST[sid]','$_REQUEST[mbaspecialization]','$_REQUEST[semonemark]','$_REQUEST[semteomark]','$_REQUEST[semthreemark]')"); 
}
if($_REQUEST['what']=="getpostgraduation")
{
    $data=$con->query("select * from studpostgraduation where sid in(select sid from student where sid = '$_REQUEST[sid]')");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
    }
    
    $json=json_encode($key);
    
    echo $json;
}
if($_REQUEST['what']=="editpostgraduation")
{
    $in=$con->query("update studpostgraduation set mbaspecialization='$_REQUEST[mbaspecialization]',semonemark='$_REQUEST[semonemark]',
    semteomark='$_REQUEST[semteomark]',semthreemark='$_REQUEST[semthreemark]' where sid='$_REQUEST[sid]'"); 
}
//postgraduation

//graduation
if($_REQUEST['what']=="studg")
{
    $in=$con->query("insert into studgraduation values(0,'$_REQUEST[sid]','$_REQUEST[gdegree]','$_REQUEST[specialization]','$_REQUEST[yearcomplete]','$_REQUEST[cgpi]','$_REQUEST[percentage]','$_REQUEST[gclass]','$_REQUEST[gcollegename]','$_REQUEST[gcollegeadd]','$_REQUEST[gcollegecity]','$_REQUEST[gcollegepincode]','$_REQUEST[guniversity]','$_REQUEST[ganygapp]','$_REQUEST[ggapyear]')"); 
}
if($_REQUEST['what']=="getgraduation")
{
    $data=$con->query("select * from studgraduation where sid in(select sid from student where sid = '$_REQUEST[sid]')");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
    }
    
    $json=json_encode($key);
    
    echo $json;
}
if($_REQUEST['what']=="editgraduation")
{
    $in=$con->query("update studgraduation set gdegree='$_REQUEST[gdegree]',
    specialization='$_REQUEST[specialization]',yearcomplete='$_REQUEST[yearcomplete]',cgpi='$_REQUEST[cgpi]',
    percentage='$_REQUEST[percentage]',gclass='$_REQUEST[gclass]',gcollegename='$_REQUEST[gcollegename]',
    gcollegeadd='$_REQUEST[gcollegeadd]',gcollegecity='$_REQUEST[gcollegecity]',gcollegepincode='$_REQUEST[gcollegepincode]',
    guniversity='$_REQUEST[guniversity]',ganygapp='$_REQUEST[ganygapp]',ggapyear='$_REQUEST[ggapyear]' where sid='$_REQUEST[sid]'"); 
}
//graduation over
//12 start
if($_REQUEST['what']=="student12details")
{
    $in=$con->query("insert into studtwelvedetails values(0,'$_REQUEST[sid]','$_REQUEST[twepassingyear]','$_REQUEST[twecgpi]','$_REQUEST[twepercentage]','$_REQUEST[tweclass]','$_REQUEST[twespecialization]','$_REQUEST[tweschoolname]','$_REQUEST[tweschooladd]','$_REQUEST[tweschoolcity]','$_REQUEST[tweschoolpincode]','$_REQUEST[tweboard]','$_REQUEST[tweanygap]','$_REQUEST[twegapyear]')"); 
}
if($_REQUEST['what']=="gettwelvedetails")
{
    $data=$con->query("select * from studtwelvedetails where sid in(select sid from student where sid = '$_REQUEST[sid]')");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
    }
    
    $json=json_encode($key);
    
    echo $json;
}
if($_REQUEST['what']=="editstudent12details")
{
    $in=$con->query("update studtwelvedetails set twepassingyear='$_REQUEST[twepassingyear]',
    twecgpi='$_REQUEST[twecgpi]',twepercentage='$_REQUEST[twepercentage]',
    tweclass='$_REQUEST[tweclass]',twespecialization='$_REQUEST[twespecialization]',
    tweschoolname='$_REQUEST[tweschoolname]',tweschooladd='$_REQUEST[tweschooladd]',
    tweschoolcity='$_REQUEST[tweschoolcity]',tweschoolpincode='$_REQUEST[tweschoolpincode]',
    tweboard='$_REQUEST[tweboard]',tweanygap='$_REQUEST[tweanygap]',
    twegapyear='$_REQUEST[twegapyear]' where sid='$_REQUEST[sid]'"); 
}
//12 over
//studaddqualication
if($_REQUEST['what']=="studaddqualication")
{
    $in=$con->query("insert into studadditionalqualification values(0,'$_REQUEST[sid]','$_REQUEST[addqualification]','$_REQUEST[cmatscore]')"); 
}
if($_REQUEST['what']=="getadditionalqualification")
{
    $data=$con->query("select * from studadditionalqualification where sid in(select sid from student where sid = '$_REQUEST[sid]')");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
    }
    
    $json=json_encode($key);
    
    echo $json;
}
if($_REQUEST['what']=="editadditionalqualification")
{
    $in=$con->query("update studadditionalqualification set addqualification='$_REQUEST[addqualification]',
    cmatscore='$_REQUEST[cmatscore]' where sid='$_REQUEST[sid]'"); 
}
//studaddqualicationover

//studworkexp
if($_REQUEST['what']=="studworkexp")
{
    $in=$con->query("insert into studworkexp values(0,'$_REQUEST[sid]','$_REQUEST[totalworkexp]','$_REQUEST[lastsalary]','$_REQUEST[firstorgname]','$_REQUEST[firstdesignation]','$_REQUEST[firstduration]','$_REQUEST[secorgname]','$_REQUEST[secdesignation]','$_REQUEST[secduration]')"); 
}
if($_REQUEST['what']=="getworkexp")
{
    $data=$con->query("select * from studworkexp where sid in(select sid from student where sid = '$_REQUEST[sid]')");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
    }
    
    $json=json_encode($key);
    
    echo $json;
}
if($_REQUEST['what']=="editworkexp")
{
    $in=$con->query("update studworkexp set totalworkexp='$_REQUEST[totalworkexp]',lastsalary='$_REQUEST[lastsalary]',
    firstorgname='$_REQUEST[firstorgname]',firstdesignation='$_REQUEST[firstdesignation]',
    firstduration='$_REQUEST[firstduration]',secorgname='$_REQUEST[secorgname]',
    secdesignation='$_REQUEST[secdesignation]',secduration='$_REQUEST[secduration]' where sid='$_REQUEST[sid]'"); 
}
//studworkexpover

//studinternship
if($_REQUEST['what']=="studinternship")
{
    $in=$con->query("insert into studinternship values(0,'$_REQUEST[sid]','$_REQUEST[siptitle]','$_REQUEST[sipcompany]','$_REQUEST[sipcompany]','$_REQUEST[sipcompany]')"); 
}
if($_REQUEST['what']=="getinternship")
{
    $data=$con->query("select * from studinternship where sid in(select sid from student where sid = '$_REQUEST[sid]')");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
    }
    
    $json=json_encode($key);
    
    echo $json;
}
if($_REQUEST['what']=="editinternship")
{
    $in=$con->query("update studinternship set siptitle='$_REQUEST[siptitle]',
    sipcompany='$_REQUEST[sipcompany]',sipcompany='$_REQUEST[sipcompany]',
    sipcompany='$_REQUEST[sipcompany]'  where sid='$_REQUEST[sid]'"); 
    
}
//studinternshipover

//studextraachievement
if($_REQUEST['what']=="studextraachievement")
{
    $in=$con->query("insert into studextraachievement values(0,'$_REQUEST[sid]','$_REQUEST[exactivity]','$_REQUEST[specificachieve]','$_REQUEST[message]')"); 
}
if($_REQUEST['what']=="getextraachievement")
{
    $data=$con->query("select * from studextraachievement where sid in(select sid from student where sid = '$_REQUEST[sid]')");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
    }
    
    $json=json_encode($key);
    
    echo $json;
}
if($_REQUEST['what']=="editextraachievement")
{
    $in=$con->query("update studextraachievement exactivity='$_REQUEST[exactivity]',
    specificachieve='$_REQUEST[specificachieve]',message='$_REQUEST[message]' where sid='$_REQUEST[sid]'"); 
    
    

}
//studextraachievementover

//studentprofile
if($_REQUEST['what']=="studentprofile")
{
    $in=$con->query("insert into studprofile values(0,' $_REQUEST[sid]','$_REQUEST[surname]','$_REQUEST[name]','$_REQUEST[fname]','$_REQUEST[gname]','$_REQUEST[gender]','$_REQUEST[category]','$_REQUEST[prino]','$_REQUEST[alterno]','$_REQUEST[parentno]','$_REQUEST[currentDate]','$_REQUEST[langeng]','$_REQUEST[langhindi]','$_REQUEST[langguj]','$_REQUEST[langmarathi]','$_REQUEST[langother]','$_REQUEST[preadd]','$_REQUEST[precity]','$_REQUEST[prepincode]','$_REQUEST[prestate]','$_REQUEST[peradd]','$_REQUEST[percity]','$_REQUEST[perpincode]','$_REQUEST[perstate]','$_REQUEST[pancardno]','$_REQUEST[adharno]','$_REQUEST[dlicenceno]','$_REQUEST[bgroup]')"); 
}
if($_REQUEST['what']=="getstudentprofile")
{
    $data=$con->query("select * from studprofile where sid in(select sid from student where sid = '$_REQUEST[sid]')");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
    }
    
    $json=json_encode($key);
    
    echo $json;
}

if($_REQUEST['what']=="studenteditprofile")
{
    $in=$con->query("update studprofile set surname='$_REQUEST[surname]',name='$_REQUEST[name]',fname='$_REQUEST[fname]',gname='$_REQUEST[gname]',gender='$_REQUEST[gender]',category='$_REQUEST[category]',prino='$_REQUEST[prino]',alterno='$_REQUEST[alterno]',parentno='$_REQUEST[parentno]',dob='$_REQUEST[dob]',langeng='$_REQUEST[langeng]',langhindi='$_REQUEST[langhindi]',langguj='$_REQUEST[langguj]',langmarathi='$_REQUEST[langmarathi]',langother='$_REQUEST[langother]',preadd='$_REQUEST[preadd]',precity='$_REQUEST[precity]',prepincode='$_REQUEST[prepincode]',prestate='$_REQUEST[prestate]',peradd='$_REQUEST[peradd]',percity='$_REQUEST[percity]',perpincode='$_REQUEST[perpincode]',perstate='$_REQUEST[perstate]',pancardno='$_REQUEST[pancardno]',adharno='$_REQUEST[adharno]',dlicenceno='$_REQUEST[dlicenceno]',bgroup='$_REQUEST[bgroup]' where sid in (select sid from student where sid='$_REQUEST[sid]')");
}
//studentprofileover


if($_REQUEST['what']=="getstudent")
{
    $data=$con->query("select * from student where email = '$_REQUEST[email]'");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
    }
    
    $json=json_encode($key);
    
    echo $json;
}
if($_REQUEST['what']=="updatepassword")
{
    $in=$con->query("update student set password='$_REQUEST[password]' where sid='$_REQUEST[sid]'");
   
}
if($_REQUEST['what']=="gethiringdetails")
{
    $data_h=$con->query("select * from hiring H LEFT JOIN company C ON H.cid=C.cid where C.cid = '$_REQUEST[cid]'");  
    while($row_h=mysqli_fetch_assoc($data_h))
    {
        $key_h['student'][]=$row_h;
    }
    
    $json_h=json_encode($key_h);
    
    echo $json_h;
}

if($_REQUEST['what']=="getstudenteid")
{
    $data=$con->query("select * from studprofile where eid= '$_REQUEST[cid]'");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
    }
    
    $json=json_encode($key);
    
    echo $json;
}

if($_REQUEST['what']=="getstudentdetails")
{
    $data=$con->query("select * from student");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
    }
    
    $json=json_encode($key);
    
    echo $json;
}


if($_REQUEST['what']=="getstudentlogin")
{
    $json = null;
    $data=$con->query("select * from student where email='$_REQUEST[email]' AND password = '$_REQUEST[password]'");  
    //$data=$con->query("select * from student where email='$_REQUEST[email]' AND password = '$_REQUEST[password]'");  
    //$data=$con->query("select * from student where email = '$_REQUEST[email]' AND password = '$_REQUEST[password]'");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row; 
        $json=json_encode($key);
    }
    
    echo $json;
}

if($_REQUEST['what']=="getcoodinatorlogin")
{
    $json = null;
    $data=$con->query("select * from coodinater where email = '$_REQUEST[email]' AND password = '$_REQUEST[password]'");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
        $json=json_encode($key);
    }
    
    
    
    echo $json;
}

if($_REQUEST['what']=="getcompanydetails")
{
    $data=$con->query("select * FROM company ");  
    while($row=mysqli_fetch_assoc($data))
    {
        //var cid=inserted_id();
       // $cid = $row['cid'];
        $key['student'][]=$row;
        //$cid = $key['cid'];
    }
    
    $json=json_encode($key);
    
    echo $json;
}
if($_REQUEST['what']=="getcompanyupdate")
{
    $data=$con->query("select * FROM company where cid= '$_REQUEST[cid]' ");  
    while($row=mysqli_fetch_assoc($data))
    {
        //var cid=inserted_id();
       // $cid = $row['cid'];
        $key['student'][]=$row;
        //$cid = $key['cid'];
    }
    
    $json=json_encode($key);
    
    echo $json;
}

if($_REQUEST['what']=="getcompanyin")
{
    $data=$con->query("select max(cid) AS cid FROM company");  
    while($row=mysqli_fetch_assoc($data))
    {
        //var cid=inserted_id();
       // $cid = $row['cid'];
        $key['student'][]=$row;
        //$cid = $key['cid'];
    }
    
    $json=json_encode($key);
    
    echo $json;
    //echo $con->insert_id;

}

if($_REQUEST['what']=="getstuddetails")
{
    $data=$con->query("SELECT * FROM studprofile ORDER BY eid DESC LIMIT 1");  
    while($row=mysqli_fetch_assoc($data))
    {
        //var cid=inserted_id();
       // $cid = $row['cid'];
        $key['student'][]=$row;
        //$cid = $key['cid'];
    }
    
    $json=json_encode($key);
    
    echo $json;
}

if($_REQUEST['what']=="getcompanyd")
{
   // $data1=$con->query("select count(*) FROM company");
    $data=$con->query("select * from company");  
    while($row=mysqli_fetch_assoc($data))
    {
       // $cid = $row['cid'];
        $key['student'][]=$row;
        //$cid = $key['cid'];
    }
    
    $json=json_encode($key);
    
    echo $json;
}

if($_REQUEST['what']=="getcompanydisplay")
{
   // $data1=$con->query("select count(*) FROM company");
    $data=$con->query("select * from company");  
    while($row=mysqli_fetch_assoc($data))
    {
       // $cid = $row['cid'];
        $key['student'][]=$row;
        //$cid = $key['cid'];
    }
    
    $json=json_encode($key);
    
    echo $json;
}


if($_REQUEST['what']=="companydetails")
{
    //print_r($_REQUEST);
    //print_r($_SESSION);
    $in=$con->query("insert into company values(0,'$_REQUEST[cname]','$_REQUEST[about]','$_REQUEST[contactno]')"); 

   /* if(mysqli_query($link, $sql)){
        // Obtain last inserted id
        $last_id = mysqli_insert_id($link);
        echo "Records inserted successfully. Last inserted ID is: " . $last_id;
    } else{
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
    }*/

}
if($_REQUEST['what']=="updatecompanydetails")
{
    $in=$con->query("update company set cname='$_REQUEST[cname]',about='$_REQUEST[about]',contactno='$_REQUEST[contactno]' where cid='$_REQUEST[cid]'");
   
}
if($_REQUEST['what']=="updatecompanyhiringdetails")
{
    $in=$con->query("update hiring set desioffer='$_REQUEST[desioffer]',roles='$_REQUEST[roles]',othrequirement='$_REQUEST[othrequirement]',department='$_REQUEST[department]',sector='$_REQUEST[sector]',location='$_REQUEST[location]',jdate='$_REQUEST[jdate]',status='$_REQUEST[status]' where cid='$_REQUEST[cid]'");
   
}
   // if(mysqli_query($data, $sql)){
        // Obtain last inserted id
     //   $cid = mysqli_insert_id($data);
     //   echo "Records inserted successfully. Last inserted ID is: " . $cid;
    //}
    //$con->exec($sql);
    //$last_id = $con->lastInsertId();
    //echo $last_id;die;


if($_REQUEST['what']=="companyhiringdetails")
{
   // $cid=$con->query("select MAX(cid) from company");
    //echo $cid;die;
    //print_r($_REQUEST);
    //print_r($_SESSION);
    $in=$con->query("insert into hiring values(0,'$_REQUEST[cid]','$_REQUEST[desioffer]','$_REQUEST[roles]','$_REQUEST[othrequirement]','$_REQUEST[department]','$_REQUEST[sector]','$_REQUEST[location]','$_REQUEST[jdate]','$_REQUEST[status]')"); 

}

if($_REQUEST['what']=="studentapply")
{
   // $cid=$con->query("select MAX(cid) from company");
    //echo $cid;die;
    //print_r($_REQUEST);
    //print_r($_SESSION);
    $in=$con->query("insert into studentapply values(0,'$_REQUEST[cid]','$_REQUEST[sid]','$_REQUEST[interview]','$_REQUEST[status]')"); 

}

if($_REQUEST['what']=="statusupdate")
{
    $in=$con->query("update studentapply set status='$_REQUEST[status]' where sid='$_REQUEST[sid]'");
   
}

if($_REQUEST['what']=="applyincompany")
{
    
    $in=$con->query("insert into studentapply values(0,'$_REQUEST[cid]','$_REQUEST[sid]','$_REQUEST[interview]','$_REQUEST[status]')"); 

}

if($_REQUEST['what']=="getapplystudentdetails")
{
    $data=$con->query("select * from student inner join studentapply on student.sid=studentapply.sid inner join company on studentapply.cid=company.cid where company.cid = '$_REQUEST[cid]'");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
    }
    
    $json=json_encode($key);
    
    echo $json;
}
if($_REQUEST['what']=="getstudentapplydetails")
{
    $data=$con->query("select * from studentapply SA LEFT JOIN company C on SA.cid=C.cid where SA.sid='$_REQUEST[sid]'");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
    }
    
    $json=json_encode($key);
    
    echo $json;
}
if($_REQUEST['what']=="deleteapply")
{
    $in=$con->query("delete from studentapply where applyid='$_REQUEST[applyid]'"); 
    //$in=$con->query("delete from studentapply SA LEFT Join company C on SA.cid=C.cid where SA.applyid='$_REQUEST[applyid]'"); 

}
if($_REQUEST['what']=="getstudentselection")
{
    $data=$con->query("select * from studentapply SA LEFT JOIN company C on SA.cid=C.cid where SA.sid='$_REQUEST[sid]' and SA.status='selected'");  
    while($row=mysqli_fetch_assoc($data))
    {
        $key['student'][]=$row;
    }
    
    $json=json_encode($key);
    
    echo $json;
}
if($_REQUEST['what']=="checkmaxcompany")
{
    $cnt = 0;
    $data=$con->query("select COUNT(*) AS cnt from studentapply SA WHERE SA.sid='$_REQUEST[sid]' and SA.status='selected'");  
    while($row=mysqli_fetch_assoc($data))
    {
        $cnt=$row['cnt'];
    }
    
    echo $cnt;
}

if($_REQUEST['what']=="insertcsv")
{
    $in=$con->query("insert into student values(0,'$_REQUEST[eid]','$_REQUEST[email]','$_REQUEST[password]')"); 

}

/*if($_REQUEST['what']=="sendemail")
{
    
    $headers = "From: tikiwalakrishna@gmail.com". "\n";
    $to = "tikiwalakrishna@gmail.com";
    $headers .= "MIME-Version: 1.0\n";
    $headers .= "Content-type: text/html; charset=iso-8859-1 \n";
    $subject = "Test mail";
    $body = "Hello";
    if (mail($to, $subject, $body, $headers)) {
        echo "Done";
    } else {
        echo "Fail";
    }
    die;
    


   /* $file_path = $_SERVER['DOCUMENT_ROOT'];
    //'/home/u303366101/domains/codealphainfotech.com/public_html/luthara';
    $bdata = json_decode($_POST['bdata'],true);
    
    header('Content-Type: text/csv');
    header('Content-Disposition: attachment; filename="'.$file_path.'/uploads/student.csv"');
    $user_CSV[0] = array('enrollno', 'email');
    
    for($i=0; $i<count($bdata); $i++)
    {
        $enrollno = $bdata[$i]['enrollno']; 
        $email = $bdata[$i]['email']; 
        $j = $i+1;
        $user_CSV[$j] = array($enrollno, $email);
    }
        $fp = fopen('php://output', 'w+');
        foreach ($user_CSV as $line) {
            fputcsv($fp, $line, ',');
        }
        //fclose($fp);

        $headers = array(
            "From: tikiwalakrishna@gmail.com",
            "Reply-To: tikiwalakrishna@gmail.com",
            "Content-Type: multipart/mixed;"
        );
        $fp2 = stream_get_contents($fp);
        $attachment = chunk_split(base64_encode($fp2));

        $body = "\r\n"
        . "Content-Type: text/plain; charset=ISO-8859-1; format=flowed\r\n"
        . "Content-Transfer-Encoding: 7bit\r\n"
        . "\r\n"
        . "Content-Type: text/csv\r\n"
        . "Content-Transfer-Encoding: base64\r\n"
        . "Content-Disposition: attachment; filename=student.csv\r\n"
        . "\r\n"
        . $attachment."\r\n";

    // Send the email, return the result
    mail("tikiwalakrishna@gmail.com", "Student Test", $body, implode("\r\n", $headers));

echo("email send");
    die;
}*/

?>