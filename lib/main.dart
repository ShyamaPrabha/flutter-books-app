import 'package:flutter/material.dart';
import 'package:my_books/bootstrap.dart';

import 'screens/my_app.dart';

Future<void> main() async {
  runApp(await bootstrap(const MyApp()));
}
