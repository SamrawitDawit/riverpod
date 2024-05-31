// infrastructure/data_sources/medicine_data_source.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class MedicineDataSource {
  final String baseUrl = 'http://10.0.2.2:3000';

  Future<List<Map<String, dynamic>>> fetchMedicines() async {
    final response = await http.get(Uri.parse('$baseUrl/medicines/all'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load medicines');
    }
  }

  Future<void> addMedicine(Map<String, String> medicine) async {
    final response = await http.post(
      Uri.parse('$baseUrl/medicines/new'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(medicine),
    );

    if (response.statusCode != 201) {
      print(response.body);
      throw Exception('Failed to add medicine');

    }
  }

  Future<void> editMedicine(String id, Map<String, String> medicine) async {
    final response = await http.put(
      Uri.parse('$baseUrl/medicines/$id'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(medicine),
    );

    if (response.statusCode != 200) {
      print(response.body);
      throw Exception('Failed to edit medicine');
    }
  }

  Future<void> deleteMedicine(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/medicines/$id'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete medicine');
    }
  }
}
