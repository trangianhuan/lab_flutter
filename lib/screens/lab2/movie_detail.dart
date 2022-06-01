import 'package:flutter/material.dart';
import 'package:lab_flutter/models/genre_model.dart';
import 'package:lab_flutter/models/movie_model.dart';
import 'package:lab_flutter/providers/movie_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import 'components/triangle.dart';

class MovieDetail extends StatelessWidget {
  final MovieModel movie;

  const MovieDetail({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double heightTriangle = height / 14;
    List<GenreModel> genres = context.watch<MovieProvider>().genres;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Movie Detail',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height / 3,
            child: Stack(
              children: [
                Image.network(
                  movie.backdropPath,
                  width: double.infinity,
                  height: height / 3,
                  fit: BoxFit.cover,
                ),
                CustomPaint(
                  size: Size(double.infinity, heightTriangle),
                  // size: Size.infinite,
                  painter: Triangle(
                    color: Colors.white,
                    heightStart: height / 3 - heightTriangle,
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 8,
                  child: Image.network(
                    movie.posterPath,
                    width: 100,
                    height: 150,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    movie.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                CircularPercentIndicator(
                  radius: 16.0,
                  lineWidth: 4.0,
                  animation: true,
                  percent: movie.voteAverage / 10,
                  center: Text(
                    movie.voteAverage.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: const Color(0xFF0A0A0A),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildColumn('review_icon.png', 'Reviews'),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
                buildColumn('play_icon.png', 'Trailers'),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey.shade300),
              ),
            ),
            child: Row(
              children: [
                buildColumn(
                    'Genre',
                    genres
                        .where((element) => movie.genreIds.contains(element.id))
                        .map((e) => e.name)
                        .join(','),
                    isIcon: false),
                buildColumn('Release', movie.releaseDate, isIcon: false),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(movie.overview),
            ),
          )
        ],
      ),
    );
  }
}

Widget buildColumn(String icon, String title, {bool isIcon = true}) {
  return Flexible(
    flex: 1,
    child: InkWell(
      onTap: isIcon ? () {} : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: isIcon ? 8 : 12),
              if (isIcon) Image.asset('assets/images/$icon'),
              if (!isIcon) ...[
                Text(
                  icon,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
              ],
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: isIcon ? 8 : 12),
            ],
          ),
        ),
      ),
    ),
  );
}
