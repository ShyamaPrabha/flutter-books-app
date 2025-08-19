
import 'package:my_books/repositories.dart/book_repository.dart';

import '../models/books_model.dart';

class BookUseCase {
  final BookRepository  repository;
  BookUseCase({required this.repository});

  Future<NovelSubject> getNovelsList() async {
    return await repository.getNovelsList();
  }
}