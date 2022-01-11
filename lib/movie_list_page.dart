import 'package:flutter/material.dart';
import 'package:movie_app/db/sqlite_db.dart';
import 'package:movie_app/new_movie_page.dart';

import 'db/movie_model.dart';
import 'db/temp_db.dart';
import 'movie_item2.dart';

class MovieListPage extends StatefulWidget {
  static const String routeName = '/home';



  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<Movie> movieList = [];


  @override
  void didChangeDependencies() {
    _getData();
    super.didChangeDependencies();
  }
  void _getData(){
    SQLiteHelper.getAllMovies().then((list) {
      setState (() {
        movieList = list;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: movieList.isEmpty ? const Center(child: Text('No movie found!'),):

      ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 12),
        itemCount: movieList.length,
        itemBuilder: (context, index){
          final movie = movieList[index];
          return MovieItem2(movie);
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewMoviePage.routeName).then((value){
            _getData();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
