import 'dart:convert';
import 'package:http/http.dart' as http;

class FecthApiService {
  static var client = http.Client();

  static dynamic get({required Uri uri}) async {
    try {
      final response = await client.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      // print(response.body);
      return json.decode(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  static dynamic post(Uri uri, {Map<dynamic, dynamic>? params}) async {
    // print(uri);
    final response = await client.post(
      uri,
      body: jsonEncode(params),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}
