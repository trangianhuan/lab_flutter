import 'package:flutter/material.dart';
import 'package:lab_flutter/models/movie_model.dart';
import 'package:lab_flutter/screens/lab2/movie_detail.dart';

class MovieItem extends StatelessWidget {
  final MovieModel movie;
  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MovieDetail(movie: movie)),
              );
            },
            child: Image.network(
              movie.posterPath,
              width: 100,
              height: 150,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetail(movie: movie),
                      ),
                    );
                  },
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Text(
                    movie.overview,
                    maxLines: 5,
                    softWrap: false,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
