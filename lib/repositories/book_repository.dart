import 'dart:convert';

import '../models/books_model.dart';
import '../services/rest_client.dart';

class BookRepository {
  final RestClient restClient;
  BookRepository({required this.restClient});

  Future<NovelSubject> getNovelsList() async {
    final response = await restClient.getNovelsList();
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return NovelSubject.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load novels');
    }
  }
}
