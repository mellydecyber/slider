<?php
// include database and object files
include_once 'config/database.php';
include_once 'objects/event.php';
include_once 'objects/teks_berjalan.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// pass connection to objects
$event = new Event($db);
$teks = new Teks($db);
// set page headers
$page_title = "Buat Event";
include_once "header.php";
 
// contents will be here
echo "<div class='right-button-margin'>";
    echo "<a href='index.php' class='btn btn-default pull-right'>Home</a>";
echo "</div>";
 // display the products if there are any

?>

<!-- 'create product' html form will be here -->
<!-- PHP post code will be here -->
<?php 
// if the form was submitted - PHP OOP CRUD Tutorial
if($_POST){
 
    // set product property values
    $event->nama = $_POST['nama'];
    $event->keterangan = $_POST['keterangan'];
    $event->flag = '0';
    $image=!empty($_FILES["image"]["name"])
    ? sha1_file($_FILES['image']['tmp_name']) . "-" . basename($_FILES["image"]["name"]) : "";
    $event->image = $image;
    $event->tgl_mulai = $_POST['tgl_mulai'];
    $event->tgl_siap = $_POST['tgl_siap'];
    $event->status = $_POST['status'];

    // create the product
    if($event->create()){
        echo "<div class='alert alert-success'>Event Telah disimpan yeee<?php echo $event->nama; ?></div>";
                // try to upload the submitted file
        // uploadPhoto() method will return an error message, if any.
        echo $event->uploadPhoto();
    }
 
    // if unable to create the product, tell the user
    else{
        echo "<div class='alert alert-danger'>Gagal Membuat Event</div>";
    }
}
?>
<!-- HTML form for creating a product -->
<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post" enctype="multipart/form-data">

 
    <table class='table table-hover table-responsive table-bordered'>
 
        <tr>
            <td>Nama Event</td>
            <td colspan ='2'><input type='text' name='nama' class='form-control' /></td>
        </tr>

        <tr>
            <td>Keterangan</td>
            <td colspan ='2'><textarea name='keterangan' class='form-control'></textarea></td>
        </tr>
 
        <tr>
            <td>Gambar</td>
            <td colspan ='2'><input type="file" name="image" /></td>
        </tr>
        <tr>
        <tr>
        <td>Tanggal Event</td>
        <td>
        <div class="form-group">  
                <label>&nbsp;&nbsp;&nbsp;Mulai &nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</label> <br>           
                <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="10" type="text" name="tgl_mulai">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                <input type="hidden" id="dtp_input1" value=""/> <br>
                <label>&nbsp;&nbsp;&nbsp;Sampai : &nbsp;&nbsp;&nbsp;</label> <br>      
                <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="10" type="text" name="tgl_siap">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                <input type="hidden" id="dtp_input2" value=""/>
            </div></td>
        </tr>
        <tr>
        <td>Status</td>
        <td colspan='2'>
        <select class='form-control' name='status'>
                <option value='1'>Aktif</option>
                <option value='0'>Tidak Aktif</option>
            
            </select>
            </td>
            </tr>
            <tr>
            <td></td>
            <td colspan ='2'>
                <button type="submit" class="btn btn-primary">Create</button>
            </td>
        </tr>
 
    </table>
</form>
<?php
 
// footer
include_once "footer.php";
?>