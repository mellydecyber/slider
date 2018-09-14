<?php
// check if value was posted
if($_POST){
 
    // include database and object file
    include_once 'config/database.php';
    include_once 'objects/event.php';
 
    // get database connection
    $database = new Database();
    $db = $database->getConnection();
 
    // prepare product object
    $event = new Event($db);
     
    // set product id to be deleted
    $event->id = $_POST['object_id'];
     
    // delete the product
    if($event->delete()){
        echo "Event Dihapus.";
    }
     
    // if unable to delete the product
    else{
        echo "Gagal Menghapus.";
    }
}
?>