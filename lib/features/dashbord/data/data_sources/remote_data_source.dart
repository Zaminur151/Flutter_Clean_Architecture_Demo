import 'dart:convert';
import 'package:flutter_clean_arch/features/dashbord/data/models/post_model.dart';
import 'package:http/http.dart'as http;

class PostRemoteDataSource{
Future<List<PostModel>> fatchPost()async{
final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
final response = await http.get(url);

if(response.statusCode == 200){
final decoded = json.decode(response.body);
return decoded.map((e) => PostModel.fromJson(e)).toList();
}
else{
throw Exception('Failed to load');
}
}
}