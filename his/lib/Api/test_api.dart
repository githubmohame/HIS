import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Response> fsm() async {
  var x = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  Response data = await http.get(x);
  return data;
}

Future<Response> fsm2() async {
  var x = Uri.parse("https://jsonplaceholder.typicode.com/comments");
  Response data = await http.get(x);
  //print(data.body);
  return await data;
}
