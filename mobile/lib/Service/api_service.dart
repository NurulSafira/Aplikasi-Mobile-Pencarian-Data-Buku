import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_pm/Response/response_databuku.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<BookResponse?> getBooks() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/data.php'));
      debugPrint('GET Books : ${response.body}');

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON data
        return BookResponse.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        throw Exception('Failed to load books');
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<BookResponse?> searchBook(String query) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/search_data.php/?keyword=$query'));
      debugPrint('GET Search Book : ${response.body}');

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON data
        return BookResponse.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        throw Exception('Failed to load books');
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
