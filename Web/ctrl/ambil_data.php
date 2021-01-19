<?php

//memanggil file config.php yang isinya menyambungkan ke database
include 'config.php';

//mengambil semua data pada tabel user
$queryResult = $connect->query("SELECT * FROM mahasiswa");

$dataMhs = array();

//memasukan data queryResult menjadi variabel fetchData kemudian memasukannya kedalam array
//yang dimana array tersebut bervariabel result
while ($fetchData = $queryResult->fetch_assoc()) {
    $dataMhs[] = $fetchData;
}

if (isset($_GET['flutter'])) {
    echo json_encode($dataMhs);
}
//merubah array menjadi JSON
//echo json_encode($dataMhs);
