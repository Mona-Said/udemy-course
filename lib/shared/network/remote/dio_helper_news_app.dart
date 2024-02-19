import 'package:dio/dio.dart';
//https://newsapi.org/
// v2/top-headlines?
// country=eg&category=sports&apiKey=abdea69a40a24a64be364ed51325ba9f
class DioHelper
{
  static Dio? dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
         baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );

  }

  static Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,
}) async
  {
   return await dio!.get(url, queryParameters:query );
  }
  
}