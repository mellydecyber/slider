</div>
    <!-- /container -->
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 
<!-- Latest compiled and minified Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<!-- bootbox library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
<script type="text/javascript" src="libs/jquery/jquery-3.3.1.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="libs/js/bootstrap.min.js"></script>
<script type="text/javascript" src="libs/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="libs/js/locales/bootstrap-datetimepicker.id.js" charset="UTF-8"></script>
<link href="libs/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="libs/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
   
<script>
// JavaScript for deleting product
$(document).on('click', '.delete-object', function(){
 
    var id = $(this).attr('delete-id');
 
    bootbox.confirm({
        message: "<h4>Are you sure?</h4>",
        buttons: {
            confirm: {
                label: '<span class="glyphicon glyphicon-ok"></span> Yes',
                className: 'btn-danger'
            },
            cancel: {
                label: '<span class="glyphicon glyphicon-remove"></span> No',
                className: 'btn-primary'
            }
        },
        callback: function (result) {
 
            if(result==true){
                $.post('hapus_event.php', {
                    object_id: id
                }, function(data){
                    location.reload();
                }).fail(function() {
                    alert('Unable to delete.');
                });
            }
        }
    });
 
    return false;
});
</script>
<script>
jQuery(function()
{		
	// function untuk mengambil semua data
	function getAll()
	{
		$.ajax({
			url: 'konten.php',
			data: 'status=show-all',
			cache: false,
			success: function(response){
				// jika berhasil 
				$("#show-product").html(response);
			}
		});			
	}
	
	getAll(); // load ketika document ready

	// ketika ada event change
	$("#status").change(function()
	{				
		var id = $(this).find(":selected").val();
		var dataString = 'status='+ id;
				
		$.ajax({
			url: 'konten.php',
			data: dataString,
			cache: false,
			success: function(response){
				// jika berhasil 
				$("#show-product").html(response);
			} 
		});
	})
});
</script>
<script type="text/javascript">
 $('.form_date').datetimepicker({
        language:  'id',
        weekStart: 1,
        todayBtn:  1,
  autoclose: 1,
  todayHighlight: 1,
  startView: 2,
  minView: 2,
  forceParse: 0
    });
</script>
</body>
</html>