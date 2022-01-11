import 'package:flutter/material.dart';
import 'package:movie_app/custom_text_style.dart';

import 'db/movie_model.dart';
import 'movie_details_page.dart';

class MovieItem2 extends StatefulWidget {
  final Movie movie;

  const MovieItem2(this.movie);

  @override
  _MovieItem2State createState() => _MovieItem2State();
}

class _MovieItem2State extends State<MovieItem2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, MovieDetailsPage.routeName, arguments: widget.movie);
          },
          child: Card(
            elevation: 15,
            color: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Hero(
                tag: widget.movie.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    widget.movie.image,
                    width: double.maxFinite,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ),
        Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.movie.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            )),
        Positioned(
            top: 1,
            right: 20,
            child: IconButton(
              icon: const Icon(
                Icons.favorite,
                size: 50,
                color: Colors.yellow,
              ),
              onPressed: () {},
            )),
        Positioned(
            bottom: 15,
            left: 15,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 40,
                ),
                Text('${widget.movie.rating}',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    )),
              ],
            ))
      ],
    );
  }
}
