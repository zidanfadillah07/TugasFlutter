import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './pages/item_page.dart';
import './pages/movie_list.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Homepage(),
      '/item': (context) => itempage(),
      '/movielist': (context) => FilmList(),
    },
  ));
}