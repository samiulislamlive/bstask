import 'dart:convert';
import 'package:http/http.dart' as http;

class GitHubService {
  final String baseUrl = 'https://api.github.com/search/repositories';
  final Map<String, Map<String, dynamic>> _cache = {};

  Future<Map<String, dynamic>> fetchRepositories(String query) async {
    if (_cache.containsKey(query)) {
      return _cache[query]!;
    } else {
      final response = await http.get(Uri.parse('$baseUrl?q=$query&sort=stars&order=desc'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _cache[query] = data;
        return data;
      } else {
        throw Exception('Failed to load repositories');
      }
    }
  }
}
