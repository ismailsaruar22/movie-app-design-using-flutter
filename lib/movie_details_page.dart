import 'package:flutter/material.dart';
import 'package:movie_app/db/temp_db.dart';

import 'db/movie_model.dart';

class MovieDetailsPage extends StatefulWidget {
  static const String routeName = '/movie_details_page';

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late Movie movie;

  @override
  void didChangeDependencies(){
    movie = ModalRoute.of(context)!.settings.arguments as Movie;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text(widget.movie.name),),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

            pinned: true,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movie.name),
              background: Hero(
                  tag: movie.id,
                  child: Image.asset(
                    movie.image,
                    width: double.maxFinite,
                    height: 400,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            ListTile(
              title: Text(movie.name),
              subtitle: Text(movie.releaseDate.toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text('${movie.rating}')
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                movieDetials,
                style: TextStyle(fontSize: 16),
              ),
            )
          ]))
        ],
      ),
    );
  }

}
