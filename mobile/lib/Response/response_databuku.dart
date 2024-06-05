// response_databuku.dart
import 'package:project_pm/Model/model_buku.dart';

class BookResponse {
  List<BookModel> listBook = [];

  // Konstruktor named untuk mendukung null safety
  BookResponse.fromJson(json) {
    for (int i = 0; i < json.length; i++) {
      BookModel bookModel = BookModel.fromJson(json[i]);
      listBook.add(bookModel);
    }
  }
}
