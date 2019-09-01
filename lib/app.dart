import 'package:flutter/material.dart';
import 'package:movie_list_app/ui/screens/movie_list.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter movie listing app',
      home: MovieList(),
    );
  }
}