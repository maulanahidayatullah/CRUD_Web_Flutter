<?php
include 'config.php';

//Mengambil data yang dikirim melalui method POST
//kemudian mengubahnya kedalam variabel
//variabel ini nantinya akan digunakan untuk query
$id = $_POST['id'];

//mengirim query kedalam database
//$connect adalah variabel yang menyambungkan ke databse yang diambil dari include 'config.php
$connect->query("DELETE FROM mahasiswa WHERE id='$id'");
//query ini nanti akan dijalankan pada database

if (!isset($_GET['flutter'])) {
    header("location: ../index.php");
}
