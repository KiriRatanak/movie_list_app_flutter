import 'package:flutter/material.dart';
import 'package:movie_list_app/ui/screens/movie_list.dart';
import 'package:movie_list_app/ui/screens/movie_detail.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter movie listing app',
      home: MovieList(),
      // initialRoute: '/',
      routes: <String, WidgetBuilder>{
        // '/': (context) => MovieList(),
        // '/movie': (context) => MovieDetail()
      }
    );
  }
}