import 'dart:convert';

import 'package:my_books/models/books_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static const String _key = "wishlist_items";

  static Future<void> addToWishlist(Work work) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> wishlist = prefs.getStringList(_key) ?? [];

    if (!wishlist.any((item) => jsonDecode(item)["key"] == work.key)) {
      wishlist.add(jsonEncode(work.toJson()));
      await prefs.setStringList(_key, wishlist);
    }
  }

  static Future<void> removeFromWishlist(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> wishlist = prefs.getStringList(_key) ?? [];
    wishlist.removeWhere((item) => jsonDecode(item)["key"] == key);
    await prefs.setStringList(_key, wishlist);
  }

  static Future<List<Work>> getWishlistItems() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> wishlist = prefs.getStringList(_key) ?? [];
    return wishlist.map((e) => Work.fromJson(jsonDecode((e)))).toList();
  }
}
