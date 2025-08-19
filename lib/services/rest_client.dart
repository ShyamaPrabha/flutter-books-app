import 'package:http/http.dart' as http;
import 'package:my_books/core/constants.dart';

class RestClient {
  final http.Client client;
  RestClient({required this.client});

  Future<http.Response> getNovelsList() async {
    return await client.get(Uri.parse(novelListingUrl));
  }
}
