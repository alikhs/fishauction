<?php
include('koneksi.php');

$nama = $_POST['nama'];
$username = $_POST['username'];
$password = MD5($_POST['password']);
$nohp = $_POST['nohp'];

$nohp = str_replace(" ","",$nohp);
     // kadang ada penulisan no hp (0274) 778787
     $nohp = str_replace("(","",$nohp);
     // kadang ada penulisan no hp (0274) 778787
     $nohp = str_replace(")","",$nohp);
     // kadang ada penulisan no hp 0811.239.345
     $nohp = str_replace(".","",$nohp);
 
     // cek apakah no hp mengandung karakter + dan 0-9
     if(!preg_match('/[^+0-9]/',trim($nohp))){
         // cek apakah no hp karakter 1-3 adalah +62
         if(substr(trim($nohp), 0, 3)=='+62'){
             $hp = trim($nohp);
         }
         // cek apakah no hp karakter 1 adalah 0
         elseif(substr(trim($nohp), 0, 1)=='0'){
             $hp = '+62'.substr(trim($nohp), 1);
         }
     }

$fileName = $_FILES['picture']['name']; //get the file name
$fileSize = $_FILES['picture']['size']; //get the size
$fileError = $_FILES['picture']['error']; //get the error when upload


if($fileSize > 0 || $fileError == 0){ //check if the file is corrupt or error
$move = move_uploaded_file($_FILES['picture']['tmp_name'], 'atribut/img/'.$fileName); //save image to the folder


if($move){
$masuk = mysql_query("INSERT INTO user (username,password,level,nama,nohp,foto,folder) VALUES ('$username','$password','nelayan','$nama','$hp','$fileName','atribut/img/$fileName')");

$result = mysql_query($masuk);

$q1 = "SELECT location from user where filename = '$fileName' limit 1 "; //get the image that have been uploaded
$result = mysql_query($q1);

} else{
echo "<script>alert('Failed to Upload Foto')</script>";
}
}

if($masuk){
	echo "<script>alert('Data berhasil disimpan'); window.location = 'login.php'</script>";
	
}else {
	echo "<script>alert('Data gagal disimpan'); window.location = 'daftar-nelayan.php'</script>";
}

?>