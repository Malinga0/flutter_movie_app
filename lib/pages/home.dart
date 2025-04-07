import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_movie_app/core/constants.dart';
import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:flutter_movie_app/services/api_service.dart';
import 'package:flutter_movie_app/widgets/movie_cart.dart';
import 'package:flutter_movie_app/widgets/movie_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.black,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(child: Image.asset('assets/bg1.png')),
            Positioned(
              top: 300,
              right: -100,
              child: Image.asset('assets/bg2.png'),
            ),
            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.2)),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.15),
                    Center(
                      child: Text(
                        'What would you \n Like to watch?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white60,
                                hintText: 'Search',
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.search, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    MovieList(type: 'popular', title: 'Popular'),
                    MovieList(type: 'top_rated', title: 'Top Rated'),
                    MovieList(type: 'upcoming', title: 'Upcoming'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
