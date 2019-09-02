import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_list_app/ui/screens/movie_detail.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


/*
* @author: Kiriratanak
* @param: none
* @type: stateful widget
* @desc: the base of the movie list view
*/
class MovieList extends StatefulWidget {
  @override
  MovieListState createState() {
    return MovieListState();
  }
}

/*
* @author: Kiriratanak
* @param: none
* @type: state class
* @desc: it stores the current or updated state of
*        | the movie list view before update it to
*        | movie stateful widget
*/
class MovieListState extends State<MovieList> {
  var movies;
  var apiKey = '3a9c028';
  Color _baseColor = const Color(0xff3c3261);

  /*
  * @author: Kiriratanak
  * @param: none
  * @type: method
  * @desc: make get req and return json data as map
  *       | it tells when the data are retrieved
  */
  Future<Map> getJson() async {
    var url =
      'http://api.themoviedb.org/3/discover/movie?api_key=$apiKey';
    http.Response response = await http.get(url); /* making get request */
    return json.decode(response.body);
  }

  /*
  * @author: Kiriratanak
  * @param: none
  * @type: method
  * @desc: get the json data and update movie state
  */
  void getData() async{
    var data = await getJson();
    setState (() {
      movies = data['results'];
    });
  }

  viewMovie(movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
        return MovieDetail(movie);
        }
      )
    );
}



  //TODO: Add onPressed function for flat button
  @override
  Widget build(BuildContext context) {
    getData();
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
            MovieTitle(_baseColor),
            Expanded(
              child: ListView.builder(
                itemCount: movies == null ? 0 : movies.length,
                itemBuilder: (context, i) {
                  return FlatButton(
                    child: MovieCell(movies, i),
                    padding: const EdgeInsets.all(0.0),
                    color: Colors.white,
                    onPressed: () => viewMovie(movies[i])
                  );
                },
              )
            )
          ],
        )
      ),
    );
  }
}

/*
* @author: Kiriratanak
* @param: _baseColor
* @type: stateless widget
* @desc: return a movie title widget for the movie list
*/
class MovieTitle extends StatelessWidget {
  final Color _baseColor;
  MovieTitle(this._baseColor);

  @override
  Widget build(BuildContext context) {
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


/*
* @author: Kiriratanak
* @param: movies, i
* @type: stateless widget
* @desc: return the movie row display widget
*/
class MovieCell extends StatelessWidget {
  final movies;
  final i;
  final Color _baseColor = const Color(0xff3c3261);
  final imageUrl = 'https://image.tmdb.org/t/p/w500';
  MovieCell(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                margin: const EdgeInsets.all(16.0),
                child: Container(
                  width: 70.0,
                  height: 70.0
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage(imageUrl + movies[i]['poster_path']),
                    fit: BoxFit.cover
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _baseColor,
                      blurRadius: 5.0,
                      offset: Offset(2.0, 5.0)
                    )
                  ]
                ),
              )
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      movies[i]['title'],
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Arvo',
                        fontWeight: FontWeight.bold,
                        color: _baseColor
                      )
                    ),
                    Padding( padding: const EdgeInsets.all(2.0)),
                    Text(
                      movies[i]['overview'],
                      maxLines: 3,
                      style: TextStyle(
                        color: const Color(0xff8785a4),
                        fontFamily: 'Arvo'
                      )
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                )
              )
            )
          ],
        ),
        //this build a line below each movie
        Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xd2d2e1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}