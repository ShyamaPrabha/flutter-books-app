import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_books/providers/book_provider.dart';
import 'package:my_books/repositories/book_repository.dart';
import 'package:my_books/usecase/book_use_case.dart';
import 'package:provider/provider.dart';

import 'services/rest_client.dart';

Future<Widget> bootstrap(Widget child) async {
  final restClient = RestClient(client: http.Client());
  return MultiProvider(
    providers: [
      Provider.value(value: restClient),
      Provider<BookRepository>(
        create: (context) => BookRepository(
          restClient: Provider.of<RestClient>(context, listen: false),
        ),
      ),
        Provider<BookUseCase>(
        create: (context) => BookUseCase(
          repository: Provider.of<BookRepository>(context, listen: false),
        ),
      ),
       ChangeNotifierProvider<BookProvider>(
        create: (context) => BookProvider(
          bookUseCase: Provider.of<BookUseCase>(context, listen: false),
        ),
      ),
    ],
    child: child,
  );
}
