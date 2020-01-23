import 'dart:convert';
import 'package:login/components/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

enum AuthFormType {
  login,
  register
}

abstract class BaseAuth {
  Future<User> signIn(String nik, String password);
  Future<User> loadUser();
  void logout();
  User currentUser;
}

class Auth implements BaseAuth {
  User _currentUser;

  @override
  Future<User> signIn(String nik, String password) async {
    final String loginUrl = "$baseUrlMain/auth/authenticate";
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$nik:$password'));

    try {
      final http.Response _response = await http.post(
        loginUrl,
        headers: <String, String>{'authorization': basicAuth}
      );
      print(_response.statusCode);
      if (_response.statusCode == 200) {
        var _data = jsonDecode(_response.body);
        print(_data);
        User _user = User.fromJson(_data);
        _writeData();
        _currentUser = _user;
        return _currentUser;
      } else {
        _currentUser = null;
        return _currentUser;
      }
    } catch (err) {
      print(err);
    }

  }

  @override
  Future<User> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("load user nih : ${prefs.getInt('userId')}");
    if (prefs.getInt('userId') == null) {
      _currentUser = null;
    } else {
      User _user = User(
        dealerId: prefs.getInt('dealerId'),
        dealer: prefs.getString('dealer'),
        authToken: prefs.getString('authToken'),
        expiresOn: prefs.getString('expiresOn'),
        id: prefs.getInt('id'),
        issuedOn: prefs.getString('issuedOn'),
        position: prefs.getString('position'),
        userId: prefs.getInt('forgotCode'),
        username: prefs.getString('username'),
      );
      _currentUser = _user;
    }
    return _currentUser;
  }

  void _writeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('dealerId', _currentUser.dealerId);
    prefs.setString('dealer', _currentUser.dealer);
    prefs.setString('authToken', _currentUser.authToken);
    prefs.setString('expiresOn', _currentUser.expiresOn);
    prefs.setInt('id', _currentUser.id);
    prefs.setString('issuedOn', _currentUser.issuedOn);
    prefs.setString('position', _currentUser.position);
    prefs.setInt('userId', _currentUser.userId);
    prefs.setString('username', _currentUser.username);
    print("write data done : ${_currentUser.username}");
  }

  void _deleteData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('dealerId');
    prefs.remove('dealer');
    prefs.remove('authToken');
    prefs.remove('expiresOn');
    prefs.remove('id');
    prefs.remove('issuedOn');
    prefs.remove('position');
    prefs.remove('userId');
    prefs.remove('username');
    _currentUser = null;
  }

  @override
  User get currentUser => this._currentUser;


  @override
  set currentUser(User _currentUser) {
    this._currentUser = _currentUser;
  }

  @override
  void logout() {
    _deleteData();
    print('Berhasil logout');
  }

}

class User {
    int dealerId;
    String dealer;
    String authToken;
    String expiresOn;
    int id;
    String issuedOn;
    String position;
    int userId;
    String username;

    User({
        this.dealerId,
        this.dealer,
        this.authToken,
        this.expiresOn,
        this.id,
        this.issuedOn,
        this.position,
        this.userId,
        this.username,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        dealerId: json["Dealer_ID"] == null ? null : json["Dealer_ID"],
        dealer: json["Dealer"] == null ? null : json["Dealer"],
        authToken: json["Auth_Token"] == null ? null : json["Auth_Token"],
        expiresOn: json["Expires_On"] == null ? null : json["Expires_On"],
        id: json["Id"] == null ? null : json["Id"],
        issuedOn: json["Issued_On"] == null ? null : json["Issued_On"],
        position: json["position"] == null ? null : json["position"],
        userId: json["User_Id"] == null ? null : json["User_Id"],
        username: json["Username"] == null ? null : json["Username"],
    );

    Map<String, dynamic> toJson() => {
        "Dealer_ID": dealerId == null ? null : dealerId,
        "Dealer": dealer == null ? null : dealer,
        "Auth_Token": authToken == null ? null : authToken,
        "Expires_On": expiresOn == null ? null : expiresOn,
        "Id": id == null ? null : id,
        "Issued_On": issuedOn == null ? null : issuedOn,
        "position": position == null ? null : position,
        "User_Id": userId == null ? null : userId,
        "Username": username == null ? null : username,
    };
}