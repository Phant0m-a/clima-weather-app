import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    var urlPar = Uri.parse(url);
    http.Response res = await http.get(urlPar);
    if (res.statusCode == 200) {
      print(res.body);
      String body = res.body;

      return jsonDecode(body);
    } else {
      print(res.statusCode);
    }
  }
}
