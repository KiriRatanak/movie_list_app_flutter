import 'package:flutter/material.dart';

class MovieList extends StatefulWidget {
  @override
  MovieListState createState() {
    return MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  Color _baseColor = const Color(0xff3c3261);

  @override
  Widget build(BuildContext context) {
    //TODO: Fetching movies using OMDB api
    //TODO: Create list UI
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Movies',
          style: TextStyle(
            color: _baseColor,
            fontFamily: 'Arvo',
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: _baseColor
        ),
        actions: <Widget> [
          Icon(
            Icons.menu,
            color: _baseColor
          )
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MovieTitle(_baseColor)
          ],
        )
      ),
    );
  }
}

class MovieTitle extends StatelessWidget {
  final Color _baseColor;
  MovieTitle(this._baseColor);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0,0,16.0,16.0),
      child: Text(
        'Top Rated',
        style: TextStyle(
          fontSize: 40.0,
          color: _baseColor,
          fontFamily: 'Arvo',
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.left,
      )
    );
  }
}
