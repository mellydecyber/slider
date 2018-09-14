<?php
include_once 'config/core.php';
 
// include database and object files
include_once 'config/database.php';
include_once 'objects/event.php';
include_once 'objects/teks_berjalan.php';
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
$event = new Event($db);
$teks = new Teks($db);
// search form
if(isset($search_term)){
// get search term
$search_term=isset($_GET['s']) ? $_GET['s'] : '';
 
$page_title = "Cari \"{$search_term}\"";
include_once "header.php";
 
// query products
$stmt = $event->search($search_term, $from_record_num, $records_per_page);
 
// specify the page where paging is used
$page_url="search.php?s={$search_term}&";
 
// count total rows - used for pagination
$total_rows=$event->countAll_BySearch($search_term);
echo "<div class='right-button-margin'>";
    echo "<a href='index.php' class='btn btn-primary pull-right'>";
        echo "<span class='glyphicon glyphicon-plus'></span> Home";
    echo "</a>";
echo "</div>";
}else{
$status = $_REQUEST['status'];
$event->status = $status;
$stmt = $event->readAll($from_record_num, $records_per_page);
if($status == "show-all"){
	// jika selected produk get all product
	$stmt = $event->readAll($from_record_num, $records_per_page);

}
else{ 
	// else ambil data berdasarkan merk_id
	$stmt = $event->filterGo($from_record_num, $records_per_page);
}
$total_rows=$event->countAll();
echo "<div class='right-button-margin'>";
    echo "<a href='buat_event.php' class='btn btn-primary pull-right'>";
        echo "<span class='glyphicon glyphicon-plus'></span> Buat Event";
    echo "</a>";
echo "</div>";
}
$page_url = "index.php?";
///////////////////////////////////////////////

?>
       
 <?php
// create product button

 
// display the products if there are any
if($total_rows>0){
 
    echo "<table class='table table-hover table-responsive table-bordered'>";
        echo "<tr>";
            echo "<th>Nama</th>";
            echo "<th>Tanggal Input</th>";
            echo "<th>Actions</th>";
        echo "</tr>";
 
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
 
            extract($row);
 
            echo "<tr>";
                echo "<td>{$nama}</td>";
                echo "<td>{$tanggal}</td>";
                
 
                echo "<td>";
 
                    // read product button
                    echo "<a href='detail.php?id={$id}' class='btn btn-primary left-margin'>";
                        echo "Detail";
                    echo "</a>";
 
                    // edit product button
                    echo "<a href='edit_event.php?id={$id}' class='btn btn-info left-margin'>";
                        echo "Edit";
                    echo "</a>";
 
                    // delete product button
                    echo "<a delete-id='{$id}' class='btn btn-danger delete-object'>";
                        echo "Hapus";
                    echo "</a>";
 
                echo "</td>";
 
            echo "</tr>";
 
        }
 
    echo "</table>";
 
    // paging buttons
    include_once 'paging.php';
}
 
// tell the user there are no products
else{
    echo "<div class='alert alert-danger'>No products found.</div>";
}
?>