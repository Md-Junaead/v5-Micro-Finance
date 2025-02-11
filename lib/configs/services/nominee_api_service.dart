import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/nominee_model.dart';

class ApiService {
  static const String _apiUrl = "http://84.247.161.200:9090/api/nominee/getAll";

  // Fetch nominee list from API
  static Future<List<Nominee>> fetchNominees() async {
    try {
      final response = await http.get(Uri.parse(_apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Nominee.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load nominee data");
      }
    } catch (e) {
      return []; // Return an empty list on error
    }
  }
}
