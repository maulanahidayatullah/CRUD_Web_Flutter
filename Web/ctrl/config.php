<?php

//variabel connect adalah menyambungkan ke database dengan nama database api
$connect = new mysqli("localhost", "root", "", "crud_web_flutter");

//penanganan error jika database tidak nyambung
if ($connect) {
} else {
    echo " NOOOOO";
}
