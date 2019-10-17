import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper{
   String url;
   final String api_key='de172246e2e8f73e465ef9d110d83556';
   NetworkHelper(this.url);

   Future<Map> weatherinfo() async {
     Response response = await get(url);
     Map weatherMap = jsonDecode(response.body);
     return weatherMap;
   }
}