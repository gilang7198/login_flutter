import 'package:flutter/material.dart';
import 'package:login/components/root_page.dart';
import 'package:login/models/auth.dart';
import 'package:login/models/auth_provider.dart';
import 'package:login/pages/onboarding.dart';
class PageSwitcher extends StatefulWidget {

  PageSwitcher();

  @override
  State<StatefulWidget> createState() => new _PageSwitcherState();
}

// enum AuthStatus {
//   notSignedIn,
//   signedIn
// }

class _PageSwitcherState extends State<PageSwitcher> {
  bool _isSaved = false;
  // AuthStatus _authStatus = AuthStatus.notSignedIn;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (AuthProvider.of(context) == null) {
      setState(() {
        _isSaved = false;
      });
      return;
    }
    BaseAuth _auth = AuthProvider.of(context).auth;
    Future<User> _user = _auth.loadUser();
    _user.then((data) {
      if (data == null) {
        print("data masih null");
        setState(() {
          _isSaved = false;
        });
      } else {
        // print("data sudah diload sip ${data.name}");
        setState(() {
          // _authStatus = AuthStatus.signedIn;
          _isSaved = true;
        });
      }
    });

    // User _user = _auth.currentUser;
    // if (_user != null) {
    //   setState(() {
    //           _isSaved = false;
    //         });
    // } else {
    //   print("apakah ada yang berubah?");
    //   setState(() {
    //           _isSaved = true;
    //         });
    // }

  }

  // void _onSignedIn(User currentUser) {
  //   if (currentUser != null) {
  //     // print("masuk $_authStatus");
  //     setState(() {
  //       _authStatus = AuthStatus.signedIn;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // switch (_authStatus) {
    //   case AuthStatus.signedIn:
    //     return new RootPage();
    //     break;
    //   default:
    //     return new LoginPage(onSignedIn: _onSignedIn,);
    // }
    // if (AuthStatus.signedIn) {
    //   return new RootPage();
    // } else {
    //   return new LoginPage(onSignedIn: _onSignedIn,);
    // }
    if (_isSaved) {
      print("root page");
      return RootPage();
    } else {
      // return OnBoard1Page();
      return OnBoardingPage();
    }
  }


}
