import 'dart:convert';

import 'newsapi.dart';
import 'package:http/http.dart' as http;
class fetchrepo{


  Future<newsapi> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=d3de3b51ddb84326ad643b40007bdb46'));
    print(response.body);
    if (response.statusCode == 200) {
      return newsapi.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }
}
