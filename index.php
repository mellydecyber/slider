<?php
// core.php holds pagination variables
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
 
$page_title = "Event Prima Husada Cipta Medan";
include_once "header.php";
 
// query products

 
// specify the page where paging is used

 
// count total rows - used for pagination

 

echo "<form role='search' action='search.php'>";
    echo "<div class='input-group col-md-3 pull-left margin-right-1em'>";
        $search_value=isset($search_term) ? "value='{$search_term}'" : "";
        echo "<input type='text' class='form-control' placeholder='Ketik Nama Event' name='s' id='srch-term' required {$search_value} />";
        echo "<div class='input-group-btn'>";
            echo "<button class='btn btn-primary' type='submit'>Cari</button>";
        
        
        echo "</div>";
    echo "</div>";
echo "</form>";
echo "<div class='input-group col-md-2 pull-left margin-right-1em'>";
        echo "<div class='input-group-btn'>";
        echo "<select class='form-control' id='status'>";
        echo "<option value='show-all'>Semua</option>";                 
        echo "<option value='1'>aktif</option>";
        echo "<option value='0'>Tidak Aktif</option>";
        echo "</select>";
        echo "</div>";
        echo "</div>";
// read_template.php controls how the product list will be rendered
?>
<div id="show-product">
        <!-- data akan di tampilkan di sini -->

      </div>
 <?php
 
// layout_footer.php holds our javascript and closing html tags
include_once "footer.php";
?>