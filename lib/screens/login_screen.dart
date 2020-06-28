import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hodomstore/constants.dart';
import 'package:hodomstore/components/rounded_button.dart';
import 'package:hodomstore/screens/welcome_screen.dart';
import 'home_screen.dart';
import 'package:hodomstore/services/login_api.dart';
import 'package:flutter/services.dart';
import 'package:hodomstore/components/validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:hodomstore/services/list_categories_api.dart';
import 'package:hodomstore/services/connectivity.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  // key for SnackBar context
  final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();

  static bool _saving = false;
  var _phone;
  var _password;
  bool _obscurePassword = true;
  IconData _featherEye = Icons.remove_red_eye;
  CategoriesApi api = CategoriesApi();


  ValidateText _validateText = ValidateText();
  LoginApi login = LoginApi();

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
      key: _scaffoldKey2,
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Material(
                elevation: 10.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: IconButton(
                  icon: ImageIcon(
                      AssetImage('assets/icons/Icon ionic-ios-close@3x.png')),
                  //  Icon(Icons.close),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, WelcomeScreen.id);
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: 80.0,
                          ),
                          Text(
                            'تسجيل دخول',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: SizedBox(
                              height: 100.0,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  'رقم الهاتف',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                              TextFormField(
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                textAlignVertical: TextAlignVertical.center,
                                onChanged: (_value) {
                                  _phone = _value;
                                },
                                decoration: kTextFieldDecoration.copyWith(
                                    hintText: '+20 123 456 7896'),
                                validator: (_value) =>
                                    _validateText.validateText(
                                        value: _value, textType: 'phone'),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  'كلمة المرور',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                              TextFormField(
                                textAlign: TextAlign.end,
                                cursorColor: Colors.black,
                                textAlignVertical: TextAlignVertical.center,
                                obscureText: _obscurePassword,
                                onChanged: (_value) {
                                  _password = _value;
                                },
                                validator: (_value) =>
                                    _validateText.validateText(
                                        textType: 'password', value: _value),
                                decoration: kTextFieldDecoration.copyWith(
                                    hintText: 'أدخل كلمة المرور',
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: IconButton(
                                        icon: Icon(_featherEye),
                                        color: Colors.grey,
                                        onPressed: () {
                                          setState(() {
                                            if (_obscurePassword) {
                                              _obscurePassword = false;
                                              _featherEye =
                                                  Icons.visibility_off;
                                            } else {
                                              _obscurePassword = true;
                                              _featherEye =
                                                  Icons.remove_red_eye;
                                            }
                                          });
                                        },
                                      ),
                                    )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: InkWell(
                                    onTap: () {
                                      // what that text do when press it !!
                                    },
                                    child: Text(
                                      'هل نسيت كلمة المرور؟',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          RoundedButton(
                            color: Colors.black,
                            borderColor: Colors.black,
                            child: Text(
                              ' تسجيل دخول ',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                if (connectionStatus ==
                                    ConnectivityStatus.Offline) {
                                  setState(() {
                                    _scaffoldKey2.currentState
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
                                  });
                                } else {
                                  setState(() {
                                    _saving = true;
                                  });

                                  await login.setParameters(_phone, _password);

                                  if (login.getStatus()) {
                                    Navigator.pushNamed(context, HomeScreen.id);
                                    setState(() {
                                      _saving = false;
                                    });
                                  } else {
                                    setState(() {
                                      _saving = false;
                                      _scaffoldKey2.currentState
                                        ..showSnackBar(SnackBar(
                                          content: Text(
                                            login.getMessage(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 8.0,
                                              // textBaseline: TextAlign.center ,
                                            ),
                                          ),
                                        ));
                                    });
                                  }
                                }
                              }
                            },
                          ),
                          SizedBox(
                            height: 30.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
