import 'package:lab_flutter/providers/movie_provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

class Config {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => MovieProvider()),
  ];
}
