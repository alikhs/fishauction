<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
	<head>
		<title>Nelayan.com</title>
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		</script>
		<!----webfonts---->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
		<!----//webfonts---->
		<script src="js/jquery.min.js"></script>
		<!----start-alert-scroller---->
		<script type="text/javascript" src="js/jquery.easy-ticker.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			$('#demo').hide();
			$('.vticker').easyTicker();
		});
		</script>
		<!----start-alert-scroller---->
		<!-- start menu -->
		<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="js/megamenu.js"></script>
		<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
		<script src="js/menu_jquery.js"></script>
		<!-- //End menu -->
		<!---move-top-top---->
		<script type="text/javascript" src="js/move-top.js"></script>
		<script type="text/javascript" src="js/easing.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
				});
			});
		</script>
		<!---//move-top-top---->
	</head>
	<body>
		<!---start-wrap---->
			<!---start-header---->
			<div class="header">
				<div class="top-header">
					<div class="wrap">
						<div class="top-header-left">
							<ul>
								<li><a href="index.php"><h3 style="color:#ffffff;">Nelayan.com</h3></a></li>
							</ul>
						</div>
						<div class="top-header-right">
							<ul>
								<li><a href="login.php">Login</a><span> </span></li>
							</ul>
						</div>
						<div class="clear"> </div>
					</div>
				</div>
				<!----start-mid-head---->

		<!--- start-content---->
		<div class="content login-box">
			<div class="login-main">
				<div class="wrap">
					<h1>Daftar Akun</h1>
					<div class="register-grids">
						                
				  <div class="panel-body">
				<div class="register-top-grid">
				  <form role="form" method="post" enctype="multipart/form-data" action="proses-daftar.php">      
					  
                
					<div>
                    <b>Nama Lengkap</b>
                    <input type="text" name="nama" required="" />
					</div>
					<div>
                    <b>Username</b>
                    <input type="text" name="username" required=""/>
					</div>
					<div>
                    <b>Password</b>
                    <input type="text" name="password" required="" />
					</div>
					<div>
                    <b>No Hp</b>
                    <input type="text" name="nohp" required="" />
					</div>
					<div>
                    <b>Upload Foto</b>
                    <input type="file" name="picture" required="" />
					</div>
					
					<input title='add' type='submit' value="Daftar">
					</form>
					</div>

                    
					</div>
				</div>
			</div>
		</div>
		</div>
		<div class="footer">
			<div class="wrap">
				<div class="footer-right">
					<p>Copyright &copy; 2017 <b>Muhammad Arafat Zaipon Saputra</p>
					<script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
			    <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"> </span></a>
				</div>
				<div class="clear"> </div>
			</div>
		</div>
		<!---//End-footer---->
		<!---//End-wrap---->
	</body>
</html>

