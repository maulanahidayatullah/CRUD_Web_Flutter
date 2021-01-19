<?php
include 'config.php';

//Mengambil data yang dikirim melalui method POST
//kemudian mengubahnya kedalam variabel
//variabel ini nantinya akan digunakan untuk query
$id   = $_POST['id'];
$nama = $_POST['nama'];
$nim = $_POST['nim'];

//mengirim query kedalam database
//$connect adalah variabel yang menyambungkan ke databse yang diambil dari include 'config.php
$connect->query("UPDATE mahasiswa SET id='$id', nama='$nama', nim='$nim' WHERE id='$id'");
//query ini nanti akan dijalankan pada database

if (!isset($_GET['flutter'])) {
    header("location: ../index.php");
}
