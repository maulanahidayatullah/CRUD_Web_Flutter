<?php
include 'config.php';

//Mengambil data yang dikirim melalui method POST
//kemudian mengubahnya kedalam variabel
//variabel ini nantinya akan digunakan untuk query
$nama = $_POST['nama'];
$nim = $_POST['nim'];

//mengirim query kedalam database
//$connect adalah variabel yang menyambungkan ke databse yang diambil dari include 'config.php
$connect->query("INSERT INTO mahasiswa VALUES ('','$nama','$nim')");
//query ini nanti akan dijalankan pada database

if (!isset($_GET['flutter'])) {
    header("location: ../index.php");
}
