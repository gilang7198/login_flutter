import 'package:flutter/material.dart';
import 'package:login/models/auth.dart';


class AuthProvider extends InheritedWidget {
  AuthProvider({Key key, this.child, this.auth}) : super(key: key, child: child);

  final Widget child;
  final BaseAuth auth;

  static AuthProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }

  @override
  bool updateShouldNotify(AuthProvider oldWidget) {

    bool _isChanged = auth.currentUser != oldWidget.auth.currentUser;
    // if (_isChanged) {
    //   if (auth.currentUser != null) {
    //   // print("data berubah ${auth.currentUser.fullName}, data lama: ${oldWidget.auth.currentUser.fullName}");
    //   // print("data berubah ${auth.currentUser.fullName}, data lama: ${oldWidget.auth.currentUser.fullName}");
    //   }

    // } else {
    //   // print("data masih sama kah?");
    // }
    return _isChanged;
  }
// bool updateShouldNotify( AuthProvider oldWidget) => auth.currentUser != oldWidget.auth.currentUser;
// bool updateShouldNotify( AuthProvider oldWidget) => true;
}