import 'package:flutter/material.dart';
import 'package:login/models/auth.dart';
import 'package:login/models/auth_provider.dart';
import 'package:login/pages/page_listlead.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    BaseAuth _auth = AuthProvider.of(context).auth;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${_auth.currentUser.username}',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            ListTile(
              leading: Icon(
                Icons.power_settings_new,
                color: Colors.black,
              ),
              title: Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17
                ),
              ),
              onTap: () {
                _auth.logout();
                Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, 
            MaterialPageRoute(
              builder: (context) => LeadPage()
            )
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
