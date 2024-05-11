import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getWeatherData() async {
    var urlString = Uri.parse(url);
    final response = await http.get(urlString);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(url);
      print('error code: ${response.statusCode}');
    }
  }
}
