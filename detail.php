<?php
// set page headers
// get ID of the product to be read
$id = isset($_GET['id']) ? $_GET['id'] : die('ERROR: missing ID.');
 
// include database and object files
include_once 'config/database.php';
include_once 'objects/event.php';
include_once 'objects/teks_berjalan.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare objects
$event = new Event($db);
$teks = new Teks($db);
 
// set ID property of product to be read
$event->id = $id;
 
// read the details of product to be read
$event->readOne();
$page_title = "Detail Event";
include_once "header.php";
 
// read products button
echo "<div class='right-button-margin'>";
    echo "<a href='index.php' class='btn btn-primary pull-right'>";
        echo "Home";
    echo "</a>";
echo "</div>";
 // HTML table for displaying a product details
echo "<table class='table table-hover table-responsive table-bordered'>";
 
echo "<tr>";
    echo "<td>Nama</td>";
    echo "<td>{$event->nama}</td>";
echo "</tr>";

echo "<tr>";
    echo "<td>Keterangan</td>";
    echo "<td>{$event->keterangan}</td>";
echo "</tr>";

echo "<tr>";
    echo "<td>Tanggal Event</td>";
    echo "<td>{$event->tgl_mulai} --sampai-- {$event->tgl_siap}</td>";
echo "</tr>";

echo "<tr>";
    echo "<td>Image</td>";
    echo "<td>";
        echo $event->image ? "<img src='uploads/{$event->image}' style='width:300px;' />" : "No image found.";
    echo "</td>";
echo "</tr>";
echo "</table>";
// set footer
include_once "footer.php";
?>