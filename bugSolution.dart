```dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        // ... process jsonData ...
      } on FormatException catch (e) {
        print('Error: Invalid JSON format: $e');
        // Handle the malformed JSON, perhaps retry or display a user-friendly message
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    print('Network error: $e');
    // Handle network error, show offline message or retry
  } on FormatException catch (e) {
    print('Error: Invalid JSON format: $e');
    // Handle JSON parsing error
  } on TimeoutException catch (e) {
    print('Timeout error: $e');
    // Handle timeout error
  } catch (e) {
    print('An unexpected error occurred: $e');
    // Log unexpected errors for debugging
  }
}
```