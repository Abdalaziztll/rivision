
import 'package:dio/dio.dart';
import 'package:value_notfi_and_nav_bar/model/cat_model.dart';

Future<List<Cat>>  getCat()async{
Dio dio = Dio();

Response response =await  dio.get("https://freetestapi.com/api/v1/cats");
List<Cat> cats = List.generate(response.data.length, (index) => Cat.fromMap(response.data[index])); 

return cats;

}
