import 'dart:convert';

import 'package:flutter_movie_app/core/constants.dart';
import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Moviemodel>> fetchMovie({String type = 'popular'}) async {
    try {
      final url = Uri.parse(
        "${AppConstants.baseurl}movie/$type?api_key=${AppConstants.apiKey}",
      );
      final apiResponse = await http.get(url);
      if (apiResponse.statusCode == 200) {
        final List result = jsonDecode(apiResponse.body)['results'];
        return result.map((json) => Moviemodel.fromJson(json)).toList();
      }
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
    return [];
  }
}
