import 'package:flutter/material.dart';
import 'package:login/models/auth.dart';
import 'package:login/models/auth_provider.dart';


class LoginPage extends StatefulWidget {
  final ValueChanged<User> onSignedIn;

  LoginPage({this.onSignedIn});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String username, password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;
  bool _isAwaiting = false;
  String token = "";
  
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  void _onSignIn(User _user) {
    try {
      widget.onSignedIn(_user);
    } catch (err) {
      print ("error apaan nih $err");
    }
  }

  bool validateAndSave() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit(BuildContext context) async {
    if (validateAndSave()){
      setState(() {
        _isAwaiting = true;
      });

      BaseAuth _auth = AuthProvider.of(context).auth;
      
      User _user = await _auth.signIn(username, password);
      if (_user != null) {
        _onSignIn(_user);
      } else {
        _showDialog();
        print("error login");
      }
      setState(() {
        _isAwaiting = false;
      });
    // });
    }
  }

  void _showDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            content: Container(
              child: new Text(
                "Login gagal",
                style: TextStyle(
                    fontSize: 18.0
                ),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Oke"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (e){
                            if(e.isEmpty){
                              return "Masukan No. Handphone / Email!";
                            }
                          },
                          onSaved: (e) => username = e,
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'No. Handphone / Email',
                            labelText: 'No. Handphone / Email',
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextFormField(
                          validator: (e) {
                            if (e.isEmpty) {
                              return "Masukan password !";
                            }
                          },
                          onSaved: (e) => password = e,
                          autofocus: false,
                          obscureText: _secureText,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_secureText
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: showHide),
                            hintText: 'Password',
                          ),
                        ),
                        SizedBox(height: 24.0),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: _isAwaiting ? CircularProgressIndicator() : RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onPressed: (){
                              validateAndSubmit(context);
                            },
                            padding: EdgeInsets.all(12),
                            color: Colors.green,
                            child: Text('Masuk', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ) 
    ); 
  }
}
