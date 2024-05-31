// Infrastructure/data_sources/user_data_source.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserDataSource {
  Future<String> getUserName(String userId) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/users/$userId'));
    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body);
      final String userName = data['name'].toString();
      return userName;
    } else {
      throw Exception("Failed to load User: ${response.statusCode}");
    }
  }
}
