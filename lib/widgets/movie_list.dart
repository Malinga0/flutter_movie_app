import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:flutter_movie_app/services/api_service.dart';
import 'package:flutter_movie_app/widgets/movie_cart.dart';

class MovieList extends StatefulWidget {
  final String type;
  final String title;
  const MovieList({super.key, required this.type, required this.title});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: ApiService.fetchMovie(type: widget.type),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return Center(child: Text('No Movies Available'));
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Moviemodel moviemodel = snapshot.data![index];

                    return MovieCart(moviemodel: moviemodel);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
