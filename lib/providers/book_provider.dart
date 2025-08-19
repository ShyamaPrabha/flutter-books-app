import 'package:flutter/material.dart';
import 'package:my_books/core/shared_preferences.dart';

import '../models/books_model.dart';
import '../usecase/book_use_case.dart';

class BookProvider extends ChangeNotifier {
  final BookUseCase bookUseCase;
  BookProvider({required this.bookUseCase});
  bool isLoading = false;
  List<Work> booksList = [];
  List<Work> currentBooksList = [];
  final int pageSize = 10;
  int currentPage = 1;
  List<Work> wishlist = [];
  int get totalPages => (booksList.length / pageSize).ceil();

  Future<void> loadWishlist() async {
    wishlist = await SharedPreference.getWishlistItems();
    for (var work in wishlist) {
      work.isFavourite = wishlist.any((book) => book.key == work.key);
    }

    updatePage();
    notifyListeners();
  }

  Future<void> getNovelsList() async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await bookUseCase.getNovelsList();
      if (response.works != null) {
        booksList = response.works!;
        for (var work in booksList) {
          work.isFavourite = wishlist.any((book) => book.key == work.key);
        }
        currentBooksList = booksList.take(pageSize).toList();
        currentPage = 1;
      } else {
        booksList = [];
        currentBooksList = [];
      }
    } catch (e) {
      booksList = [];
      currentBooksList = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavourite(Work work) async {
    final exists = wishlist.any((w) => w.key == work.key);

    if (exists) {
      await SharedPreference.removeFromWishlist(work.key ?? "");
      wishlist.removeWhere((w) => w.key == work.key);
      for (var w in wishlist) {
        if (w.key == work.key) {
          w.isFavourite = false;
        }
      }
      for (var w in currentBooksList) {
        if (w.key == work.key) {
          w.isFavourite = false;
        }
      }
    } else {
      await SharedPreference.addToWishlist(work);
      wishlist.add(work);
      for (var w in wishlist) {
        if (w.key == work.key) {
          w.isFavourite = true;
        }
      }
      for (var w in currentBooksList) {
        if (w.key == work.key) {
          w.isFavourite = true;
        }
      }
    }
    notifyListeners();
  }

  void goToPage(int page) {
    if (page < 1 || page > totalPages) return;
    currentPage = page;
    updatePage();
    notifyListeners();
  }

  void updatePage() {
    final startIndex = (currentPage - 1) * pageSize;
    final endIndex = (currentPage * pageSize).clamp(0, booksList.length);
    currentBooksList = booksList.sublist(startIndex, endIndex);

    notifyListeners();
  }
}
