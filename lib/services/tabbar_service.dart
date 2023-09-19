import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:produckts/model/tabbar_model.dart';

class TabBarService {
  final String baseUrl = "https://dummyjson.com/carts/user/15";
  Future<fifteen> fetchFifteenData() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return fifteen.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data from the API');
    }
  }
}
