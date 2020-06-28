import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hodomstore/components/rounded_button.dart';
import 'package:hodomstore/services/facebook.dart';
import 'login_screen.dart';
import 'package:provider/provider.dart';
import 'package:hodomstore/services/connectivity.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Facebook _faceAccount = Facebook();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(children: <Widget>[
          Container(
              decoration: BoxDecoration(
//                gradient: LinearGradient(
//              colors: [Colors.white, Colors.black],
//              begin: Alignment.topCenter,
//              end: Alignment.bottomCenter,
//            ),
            image: DecorationImage(
              image: AssetImage('assets/welcome-screen-background.jpg'),
//                colorFilter:  ColorFilter.mode(
//                    Colors.grey.withOpacity(0.5), BlendMode.saturation),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          )),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                    flex: 16,
                    fit: FlexFit.tight,
                    child: SizedBox(),
                  ),
                  Center(
                    child: Flexible(
                      flex: 2,
                      child: Text(
                        'اهلاً بك في هدوم',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: SizedBox(
                      height: 20.0,
                      width: 20.0,
                      child: Divider(
                        height: 20.0,
                        color: Colors.white,
                        thickness: 2.5,
                        endIndent: 100.0,
                        indent: 100.0,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: SizedBox(),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: RoundedButton(
                      color: Colors.white,
                      borderColor: Colors.white,
                      borderRadius: 10.0,
                      child: Text(
                        'تسجيل دخول كمسوق',
                        style: TextStyle(
                            fontSize: 10.0, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: RoundedButton(
                      color: Colors.transparent,
                      borderRadius: 10.0,
                      borderColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            ' تسجيل دخول كعميل عبر الفيس بوك',
                            style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: ImageIcon(
                              AssetImage(
                                  'assets/icons/Icon awesome-facebook@3x.png'),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () async {
                        (connectionStatus == ConnectivityStatus.Offline)
                            ? setState(() {
                                _scaffoldKey.currentState
                                  ..showSnackBar(SnackBar(
                                    content: Text(
                                      'من فضلك تحقق من اتصالك بالانترنت',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 8.0,
                                        // textBaseline: TextAlign.center ,
                                      ),
                                    ),
                                  ));
                              })
                            : await _faceAccount.facebookSingin();
                      },
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ) /* add child content here */,
        ]),
      ),
    );
  }
}
