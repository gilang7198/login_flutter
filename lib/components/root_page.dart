import "package:flutter/material.dart";
import 'package:login/models/auth.dart';
import 'package:login/models/auth_provider.dart';
import 'package:login/pages/page_home.dart';
import 'package:login/pages/page_login.dart';

class RootPage extends StatefulWidget {

  RootPage();

  @override
    State<StatefulWidget> createState() => new _RootPageState();
    
}

enum AuthStatus {
  notSignedIn,
  signedIn
}

class _RootPageState extends State<RootPage> {

  AuthStatus _authStatus = AuthStatus.notSignedIn;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BaseAuth _auth = AuthProvider.of(context).auth;
    print("page root ${_auth.currentUser}");
    Future<User> _user = _auth.loadUser();
    _user.then((data) {
      if (data == null) {
        print("data masih null");
      } else {
        setState(() {
          _authStatus = AuthStatus.signedIn;         
        });
      }
    });

  }

  void _onSignedIn(User currentUser) {
    if (currentUser != null) {
      setState(() {
        _authStatus = AuthStatus.signedIn;         
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("status : $_authStatus");
    switch (_authStatus) {
      case AuthStatus.notSignedIn:
        return LoginPage(onSignedIn: _onSignedIn,);
        break;
      case AuthStatus.signedIn:
        return HomePage();
        break;
      default:
        return LoginPage(onSignedIn: _onSignedIn,);
    }
  }
}