import 'package:flutter/material.dart';
import 'package:lab_flutter/screens/lab2/movie.dart';
import 'package:provider/provider.dart';

import 'di/config.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: Config.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Movie(),
      // home: MovieDetail(
      //   movie: MovieModel(
      //     backdropPath:
      //         'https://image.tmdb.org/t/p/w500/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg',
      //     title:
      //         'Title title title title title title title title title title title title title title title',
      //     posterPath:
      //         'https://image.tmdb.org/t/p/w500/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg',
      //     overview: 'overview nè',
      //     releaseDate: '2021-01-02 32:33:33',
      //     voteAverage: 4.5,
      //     voteCount: 2,
      //   ),
      // ),
    );
  }
}
