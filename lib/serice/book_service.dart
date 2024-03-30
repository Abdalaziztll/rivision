import 'package:dio/dio.dart';
import 'package:value_notfi_and_nav_bar/model/book_model.dart';

Future<List<BookModel>> getBook() async {
  Dio dio = Dio();

  Response response = await dio.get("https://freetestapi.com/api/v1/books");

  List<BookModel> books = List.generate(
      response.data.length, (index) => BookModel.fromMap(response.data[index]));
print(books);
  return books;
}


Future<List<BookModel>> searchBook(String label) async {
  Dio dio = Dio();

  Response response = await dio.get("https://freetestapi.com/api/v1/books?search=${label}");

  List<BookModel> books = List.generate(
      response.data.length, (index) => BookModel.fromMap(response.data[index]));
print(books);
  return books;
}
