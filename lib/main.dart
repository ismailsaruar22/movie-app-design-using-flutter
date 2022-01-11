import 'package:flutter/material.dart';
import 'package:movie_app/movie_details_page.dart';
import 'package:movie_app/movie_list_page.dart';
import 'package:movie_app/new_movie_page.dart';
import 'movie_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: MovieListPage.routeName,
      routes: {
        //Names Routing
        NewMoviePage.routeName: (context) => NewMoviePage(),
        MovieListPage.routeName: (context) => MovieListPage(),
        MovieDetailsPage.routeName: (context) => MovieDetailsPage(),
      },
    );
  }
}
