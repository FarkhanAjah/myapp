import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String url = 'https://dog.ceo/api/breeds/image/random';

  Future<String> fetchRandomDogImage() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['message']; // Mengembalikan URL gambar anjing
    } else {
      throw Exception('Failed to load dog image');
    }
  }
}
