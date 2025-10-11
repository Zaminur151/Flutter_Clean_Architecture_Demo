import 'dart:convert';


import 'package:http/http.dart'as http;


class ProductsRemoteDataSource {
  Future<Map<String,dynamic>> fatchProduct() async{
    final url = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(url);

    if(response.statusCode == 200) {
      final Map<String, dynamic> allProducts = json.decode(response.body);
      print(allProducts);
      return allProducts;
    }
    else{
      throw Exception('API response failed');
    }
  }
}