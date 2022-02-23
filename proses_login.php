<?php
error_reporting(0);
session_start();
include "koneksi.php";
$username=$_POST['username'];
$password=$_POST['password'];
$password = md5($password);
if (isset($_POST['login'])) {
		$query=mysql_query("SELECT * FROM user WHERE username = '$username' AND password = '$password'");
		$row_count=mysql_num_rows($query);
		if($row_count){
			$data = mysql_fetch_array($query);
			$_SESSION['username'] = $data[0];
			$_SESSION['password']	= $data[1];
			$_SESSION['level'] = $data[2];
			$_SESSION['nohp'] = $data[4];
			//$_SESSION['id'] = $data[0];
			$_SESSION['nama'] = $data[3];
			$_SESSION['foto'] = $data[5];
			
					
			if ($_SESSION['level'] == 'admin'){
				header('location: level/admin/kotakmasuk/index.php');
			}elseif ($_SESSION['level'] == 'nelayan'){
				header('location: level/nelayan/tangkapan/tangkapan.php');
			}elseif ($_SESSION['level'] == 'pembeli'){
				header('location: level/pembeli/home.php');
			}else{
				header('location: login.php');
			}
		}else {
			echo "<script>alert('Username/Password Tidak Terdaftar!!'); window.location='login.php'</script>";
		}	
}
?> 