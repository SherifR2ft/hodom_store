import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Future fetchAlbumPost({body, url}) async {
    var _url = url;
    dynamic _body = body;

    var response = await http.post(_url, body: _body);
    try {
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode >= 400 && response.statusCode <= 499) {
        // check ur connection message
        return 'Lost Connection';
      } else if (response.statusCode >= 500 && response.statusCode <= 599) {
        // Server Error
        return 'Server Error';
      } else {
        return 'Lost Connection';
      }
    } catch (e) {
      print(e);
    }
  }
}
