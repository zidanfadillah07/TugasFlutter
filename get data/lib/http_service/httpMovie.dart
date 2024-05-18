import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_4/models/film.dart';
import 'package:http/http.dart'as http;


class HttpService {
  final String baseUrl = 'http://localhost:8000/api/getmovie';

  Future<List?> getPopularMovies() async {
    final String uri = baseUrl;

    http.Response result = await http.get(Uri.parse(uri));

    if(result.statusCode == HttpStatus.ok){
      print("Connected");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['data'];
      List movie = moviesMap.map((i) => Film.fromJson(i)).toList();
      return movie;
    }else{
      print("Not Connected");
      return null;
    }
    
  }
}