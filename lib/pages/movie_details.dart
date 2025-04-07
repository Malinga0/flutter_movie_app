import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/constants.dart';
import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:flutter_movie_app/widgets/movie_list.dart';
import 'package:flutter_rating/flutter_rating.dart';

class MovieDetails extends StatefulWidget {
  final Moviemodel moviemodel;
  const MovieDetails({super.key, required this.moviemodel});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .6,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      '${AppConstants.basimageurl}${widget.moviemodel.posterPath}',
                      width: size.width * .3,
                      height: size.height * .2,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black.withOpacity(0.2), Colors.black],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop<Object>();
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * .5,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            widget.moviemodel.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          StarRating(
                            rating: widget.moviemodel.voteAverage,
                            starCount: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    widget.moviemodel.overview,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  MovieList(type: 'upcoming', title: 'Upcoming'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
