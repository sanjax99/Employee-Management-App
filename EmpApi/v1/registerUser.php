<?php 
require_once '../includes/DbOperation.php'; 
$response = array();

  if($_SERVER['REQUEST_METHOD']=='POST') {
    
      if(isset($_POST['uname']) and isset($_POST['pword']) and isset($_POST['fn']) and isset($_POST['des'])) {
          $db=new DbOperation();
          $response['uu']=$_POST['uname'];
          $response['pword']=$_POST['pword'];
          $response['fn']=$_POST['fn'];
          $response['des']=$_POST['des'];
         if($db->addUserInLogin($_POST['uname'],$_POST['pword'],$_POST['fn'],$_POST['des'])) {
           $response['error']=false;
           $response['message']="Added Successfully";
         }
         else {
             $response['error']=true;
             $response['message']="Can't add the entry to DataBase";
         }
      }
      else {
          $response['error']=true;
          $response['message']="Fields are missing";
      }
  }
  else {
    $response['error']=true;
    $response['message']="Invalid Request";
}
 echo json_encode($response);

?>