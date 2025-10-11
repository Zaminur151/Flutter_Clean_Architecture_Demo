import 'dart:async';
import 'dart:convert';
import 'package:flutter_clean_arch/features/dashbord/data/models/post_model.dart';
import 'package:http/http.dart'as http;

class PostRemoteDataSource{
Future<List<PostModel>> fatchPost()async{
final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
final response = await http.get(url);

if(response.statusCode == 200){
  final List<dynamic> decoded = json.decode(response.body);
  final List<PostModel> posts = decoded.map((e) => PostModel.fromJson(e)).toList();
  return posts;
}
/// without model
  /* 
  /// JSON কে Map-এর লিস্ট হিসেবে রিটার্ন করা
  if (response.statusCode == 200) {
    final List<dynamic> decoded = json.decode(response.body);
    return decoded; // এটা List<Map<String, dynamic>> টাইপ হবে
  }
  print(decoded[0]['title']); // Output: Post One

  /// JSON কে Custom Map Structure-এ কনভার্ট করা
  if (response.statusCode == 200) {
    final List<dynamic> decoded = json.decode(response.body);

    final List<Map<String, dynamic>> posts = decoded.map((e) {
      return {
        "id": e["id"],
        "title": e["title"],
        "body": e["body"],
      };
    }).toList();

    return posts;
  }

  */
else{
throw Exception('Failed to load');
}
}
}