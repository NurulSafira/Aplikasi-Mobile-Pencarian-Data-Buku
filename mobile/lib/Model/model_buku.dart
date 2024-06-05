// model_buku.dart
class BookModel {
  String? id; // Tambahkan properti id
  String? judulBuku;
  String? penulis;
  String? penerbit;
  String? tglTerbit; // Tambahkan properti tgl Terbit
  String? foto;

  // Konstruktor biasa atau konstruktor named untuk mendukung null safety
  BookModel(
      {required this.id,
      required this.judulBuku,
      required this.penulis,
      required this.penerbit,
      required this.tglTerbit,
      required this.foto});

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judulBuku = json['judul_buku'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tglTerbit = json['tanggal_terbit'];
    foto = json['foto'];
  }
}
