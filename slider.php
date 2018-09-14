
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Rumah Sakit Prima Husada Cipta Medan</title>

    <?php
    include_once 'config/database.php';
    include_once 'objects/event.php';

    $database = new Database();
    $db = $database->getConnection();
    
    $event = new Event($db);

    $stmt = $event->tampilkanEvent();
    ?>

    <!-- Slider area -->
    <section class="slider_area row m0">
        <div class="slider_inner">
        <?php
                   while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
 
                    extract($row);
                               
                    ?>
            <div data-thumb="uploads/<?= $image; ?>" data-src="uploads/<?= $image; ?>">
                <div class="camera_caption">
                   <div class="container">             
                   <center>
                        <h3 class=" wow fadeInUp animated" data-wow-delay="0.3s">
                        <hr size="2" width="60%">
                        <?= $nama; ?>
                        </h3>
                        <hr size="2" width="60%">
                        <p class=" wow fadeInUp animated" data-wow-delay="0.5s"><?= $keterangan; ?></p>
                        </center>          
                       
                   </div>
                </div>
            </div>
            <?php
                        }
                        ?>
        </div>
    </section>
    <!-- End Slider area -->
    <div color='red'>
    <marquee> <h1>Rumah Sakit Prima Husada Cipta Medan Tanggal <?= date('Y-m-d H:i:s'); ?><h1></marquee>
</div>
  <!-- Footer Area -->
        <?php
        
        include_once 'desain.php';
        ?>
    <!-- End Footer Area -->

