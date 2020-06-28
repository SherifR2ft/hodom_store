import 'dart:async';
import 'login_api.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoriesApi {
  final String _url = 'http://hodom.innsandbox.com/api/list/categories';
  var _token = LoginApi.getToken();
  var _status;
  dynamic _responseBody;
  Future<List<Album>> fetchAlbum() async {
    dynamic response = await http.get(_url, headers: {
      'Authorization': 'Bearer $_token',
    });
    _responseBody = jsonDecode(response.body);
    _status = _responseBody['status']['code'];
    print(_status);
    if (response.statusCode == 200 && _status == 200) {
      List<Album> listPhoto = parsePhotos(response.body);

      return listPhoto;

//    } else if (response.statusCode >= 400 && response.statusCode <= 499) {
//      // check ur connection message
//      return null;
//    } else if (response.statusCode >= 500 && response.statusCode <= 599) {
//      // Server Error
//      return null;
    } else {
      return null;
    }
  }

  static List<Album> parsePhotos(dynamic responseBody) {
    dynamic parsed = jsonDecode(responseBody).cast<String, dynamic>();

    var imagesBody = parsed['result']
        .map((imageFileJson) => Album.fromJson(imageFileJson))
        .toList()
        .cast<Album>();

    return imagesBody;
  }
}

class Album {
  var categoryId;
  var name;
  var image;

  Album({this.categoryId, this.name, this.image});

  factory Album.fromJson(Map<dynamic, dynamic> json) {
    final String _url = 'http://hodom.innsandbox.com/api/list/';
    return Album(
      categoryId: json['id'],
      name: json['name'],
      image: _url + json['image'],
    );
  }
}
