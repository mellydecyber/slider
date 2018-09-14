<?php
// retrieve one product will be here
 // get ID of the product to be edited
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
 
// set ID property of product to be edited
$event->id = $id;
 
// read the details of product to be edited
$event->readOne();

 // set page header
$page_title = "Edit Event";
include_once "header.php";

// contents will be here
echo "<div class='right-button-margin'>";
echo "<a href='index.php' class='btn btn-default pull-right'>Home</a>";
echo "</div>";
?>

<!-- 'update product' form will be here -->
<!-- post code will be here -->
<?php 
// if the form was submitted
if($_POST){
    // set product property values
    $event->nama = $_POST['nama'];
    $event->keterangan = $_POST['keterangan'];
    $event->image = $_POST['image'];
    $image=!empty($_FILES["image"]["name"])
        ? sha1_file($_FILES['image']['tmp_name']) . "-" . basename($_FILES["image"]["name"]) : "";
        

        if(!empty($image)){
            echo 'heiii';    
            $event->image = $image;
        }else{
            echo 'heiii lo';
            $event->image = $_POST['gambar'];
    
        }
   
    $event->tgl_mulai = $_POST['tgl_mulai'];
    $event->tgl_siap = $_POST['tgl_siap'];
 
    // update the product
    if($event->update()){
        echo "<div class='alert alert-success alert-dismissable'>";
            echo "Event Telah Diubah.";
        echo "</div>";
        if(!empty($image)){
        echo $event->uploadPhoto();
        }else{
            $event->image = $_POST['gambar'];
        }
    }
 
    // if unable to update the product, tell the user
    else{
        echo "<div class='alert alert-danger alert-dismissable'>";
            echo "Gagal mengedit.";
        echo "</div>";
    }
}
?>
<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"] . "?id={$id}");?>" method="post" enctype="multipart/form-data">
    <table class='table table-hover table-responsive table-bordered'>

        <tr>
            <td>Nama</td>
            <td><input type='text' name='nama' value='<?php echo $event->nama; ?>' class='form-control' /></td>
        </tr>
 
        <tr>
            <td>Keterangan</td>
            <td><textarea name='keterangan' class='form-control'><?php echo $event->keterangan; ?></textarea></td>
        </tr>
 
        <tr>
            <td>Gambar</td>
            <td colspan ='2'><img src='uploads/<?= $event->image; ?>' style='width:300px;' /><input type="hidden" name="gambar" value='<?= $event->image; ?>'/><input type="file" name="image"/></td>
        </tr>

        <tr>
        <td>Tanggal Event</td>
        <td>
        <div class="form-group">  
                <label>&nbsp;&nbsp;&nbsp;Mulai &nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</label> <br>           
                <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="10" type="text" name="tgl_mulai" value="<?php echo $event->tgl_mulai; ?>">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                <input type="hidden" id="dtp_input1" value=""/> <br>
                <label>&nbsp;&nbsp;&nbsp;Sampai : &nbsp;&nbsp;&nbsp;</label> <br>      
                <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="10" type="text" name="tgl_siap" value="<?php echo $event->tgl_siap; ?>">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                <input type="hidden" id="dtp_input2" value=""/>
            </div></td>
        </tr>
        <tr>
        <td>Status</td>
        <td colspan='2'>
        <select class='form-control' name='status'>
        <?php
        $status = $event->status;
        if($status == '1'){
            ?>
                <option value='0' selected >Aktif</option>
                <option value='1'>Tidak Aktif</option>
            <?
        }else{
            ?>
            <option value='0'>Aktif</option>
                <option value='1' selected>Tidak Aktif</option>
            </select>
        <? } ?>
            </td>
            </tr>
 
        <tr>
            <td></td>
            <td>
                <button type="submit" class="btn btn-primary">Update</button>
            </td>
        </tr>
 
    </table>
</form>
<?php
 

// set page footer
include_once "footer.php";
?>