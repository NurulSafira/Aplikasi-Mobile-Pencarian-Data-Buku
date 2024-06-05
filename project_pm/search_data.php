<?php

require_once('connection.php');

// Fungsi untuk mencari data berdasarkan keyword
function search($keyword)
{
    global $connection;

    $keyword = mysqli_real_escape_string($connection, $keyword);

    $query = "SELECT * FROM data_buku WHERE judul_buku LIKE '%$keyword%' OR penulis LIKE '%$keyword%'";
    $result = mysqli_query($connection, $query);

    $data = array();
    while ($row = mysqli_fetch_array($result)) {
        $data[] = array(
            'id' => $row['id'],
            'judul_buku' => $row['judul_buku'],
            'penulis' => $row['penulis'],
            'penerbit' => $row['penerbit'],
            'tanggal_terbit' => $row['tanggal_terbit']
        );
    }

    return $data;
}

// Ambil keyword dari parameter GET
$keyword = isset($_GET['keyword']) ? $_GET['keyword'] : '';

// Panggil fungsi search dengan keyword yang diberikan
$result = search($keyword);

// Tampilkan hasil dalam format JSON
echo json_encode($result);

?>