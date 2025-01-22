```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success! 
      // But what if the JSON is malformed?
      final jsonData = jsonDecode(response.body);
      // ... process jsonData ...
    } else {
      // Handle error
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exception
    print('Error fetching data: $e');
    // What type of exception is 'e'?  
    // Is it a FormatException, SocketException etc?
    // Handle them differently.
  }
}
```