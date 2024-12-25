```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);

      // Check if jsonBody is a List or Map. Handle accordingly.
      if (jsonBody is List) {
        final List<String> data = jsonBody.map((e) => e.toString()).toList();
        print('List Data: $data');
      } else if (jsonBody is Map) {
        final Map<String, dynamic> data = jsonBody;
        print('Map Data: $data');
        // Process map data
      } else {
        print('Unknown JSON type');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```