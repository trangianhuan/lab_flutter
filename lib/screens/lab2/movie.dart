import 'package:flutter/material.dart';
import 'package:lab_flutter/providers/movie_provider.dart';
import 'package:lab_flutter/screens/lab2/components/movie_item.dart';
import 'package:provider/provider.dart';

class Movie extends StatelessWidget {
  late final ScrollController _controller;

  late BuildContext _buildContext;

  @override
  Widget build(BuildContext context) {
    context.read<MovieProvider>().fetchData();
    context.read<MovieProvider>().initGenres();
    _buildContext = context;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            'Popular',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, ui, child) {
          return NotificationListener<ScrollNotification>(
            onNotification: _scrollNotification,
            child: ListView.builder(
              itemCount: ui.movies.length,
              itemBuilder: (_, index) => MovieItem(movie: ui.movies[index]),
            ),
          );
        },
      ),
    );
  }

  bool _scrollNotification(ScrollNotification scrollInfo) {
    if ((scrollInfo.metrics.maxScrollExtent - scrollInfo.metrics.pixels) <
        300) {
      _buildContext.read<MovieProvider>().fetchData();
    }
    return true;
  }
}
