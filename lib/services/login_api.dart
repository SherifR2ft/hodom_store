import 'networking.dart';

class LoginApi {
  final String _url = 'http://hodom.innsandbox.com/api/login';
  String _phone;
  String _password;
  dynamic _responseBody;
  Networking network = Networking();
  var _message;
  var _status;
  static var _token ;

  setParameters(phone, password) async {
    _phone = phone;
    _password = password;

    _responseBody = await network.fetchAlbumPost(
        url: _url, body: {'phone': _phone, 'password': _password});

    if (_responseBody == 'Lost Connection') {
      _message = 'حدث خطأ اثناء الاتصال';
      _status = 308;
    } else if (_responseBody == 'Server Error') {
      _message = 'خطأ في الخادم';
      _status = 308;
    } else {
      _status = _responseBody['status']['code'];
      _message = _responseBody['status']['message'];

      (_status == 200)? _token = _responseBody['result']['token'] : _token= null ;
    }
  }

  getStatus() {
    try {
      if (_status == 200) {
        return true;
      } else if (_status == 308) {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  getMessage() => _message;
  static getToken() => _token ;
}
