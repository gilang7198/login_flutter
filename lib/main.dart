import 'package:flutter/material.dart';
import 'package:login/components/routes.dart';
import 'package:login/models/auth.dart';
import 'package:login/models/auth_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final BaseAuth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: _auth,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/switcher',
        routes: getRoutes(),
      ),
    );
  }
}
