<?php

require_once('connection.php');

$connection = mysqli_query($connection, "SELECT * FROM data_buku");

$result = array();
while ($row = mysqli_fetch_array($connection)) {
    $result[] = array(
        'id' => $row['id'],
        'judul_buku' => $row['judul_buku'],
        'penulis' => $row['penulis'],
        'penerbit' => $row['penerbit'],
        'tanggal_terbit' => $row['tanggal_terbit']
    );
}

echo json_encode($result);

?>
