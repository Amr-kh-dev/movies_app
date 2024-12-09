import 'dart:convert';

import 'package:movies_app/tabs/home/model/newreleases.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String apiKey = 'c7558ccb1e92b084efd7b8647dc31771';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  Future<List<NewReleases>> fetchNewReleases() async {
    final response = await http.get(Uri.parse(
        '$baseUrl/movie/upcoming?api_key=$apiKey&language=en-US&page=1'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['results'] as List).map((movie) {
        return NewReleases(
          imagePath: 'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
          title: movie['title'],
          rating: movie['vote_average'].toString(),
        );
      }).toList();
    } else {
      throw Exception('Failed to load releases movies');
    }
  }
}
