import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/constants.dart';
import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:flutter_movie_app/pages/movie_details.dart';

class MovieCart extends StatelessWidget {
  final Moviemodel moviemodel;
  const MovieCart({super.key, required this.moviemodel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap:
          () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieDetails(moviemodel: moviemodel),
            ),
          ),
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        width: size.width * 0.3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                '${AppConstants.basimageurl}${moviemodel.posterPath}',
                width: size.width * 0.3,
                height: size.height * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(moviemodel.title, style: TextStyle(color: Colors.white)),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
