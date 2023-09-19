import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:produckts/model/product_model.dart';

class ProductService {
  static Future<product_model> fetchProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      return product_model.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }
}
