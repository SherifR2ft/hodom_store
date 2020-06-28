import 'dart:async';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class Facebook {

  static final FacebookLogin _facebookSignIn = FacebookLogin();

  String _message = 'Log in/out by pressing the buttons below.';

  Future<Null> _login() async {
     final FacebookLoginResult result = await _facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        _showMessage('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  Future<Null> _logOut() async {
    await _facebookSignIn.logOut();
    _showMessage('Logged out.');
  }

   _showMessage(String message) {
    _message = message;
  }
  Future<Null> facebookSingout() async {
    await _logOut();
  }
  Future<Null> facebookSingin() async {
    await _login();
  }
}
