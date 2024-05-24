import 'package:http/http.dart' as http;

class HttpService {
  static const String apiKey = 'cf12fad81c8c400a83a3a54f168a5e1b';
  static const String baseUrl = 'https://newsapi.org/v2';

  Future<http.Response> fetchBitcoinNews() async {
    final response = await http.get(
      Uri.parse('$baseUrl/everything?q=bitcoin&apiKey=$apiKey'), // Parse the URL string to Uri object
    );
    return response;
  }
}
