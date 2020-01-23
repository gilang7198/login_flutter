import 'package:flutter/material.dart';
import 'package:login/components/app_theme.dart';
import 'package:login/components/hexcolor.dart';
import 'package:login/models/auth.dart';
import 'package:login/models/auth_provider.dart';
import 'package:login/models/prospect_model.dart';

class LeadPage extends StatefulWidget {
  @override
  _LeadPageState createState() => _LeadPageState();
}

enum SortData { name, phoneNumber, status, type }

class _LeadPageState extends State<LeadPage> {
  String _status = "All status";

  SortData _sortData;

  void _selectSort() {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          // title: Text("status"),
          content: Container(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: <Widget> [
                ListTile(
                  title: Text(
                    'Sort by Name',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  leading: Radio(
                    value: SortData.name,
                    groupValue: _sortData,
                    onChanged: (SortData value) {
                      setState(() { _sortData = value; });
                      print(value);
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'Sort by Phone Number',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  leading: Radio(
                    value: SortData.phoneNumber,
                    groupValue: _sortData,
                    onChanged: (SortData value) {
                      setState(() { _sortData = value; });
                      print(value);
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'Sort by Status',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  leading: Radio(
                    value: SortData.status,
                    groupValue: _sortData,
                    onChanged: (SortData value) {
                      setState(() { _sortData = value; });
                      print(value);
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'Sort by Type',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  leading: Radio(
                    value: SortData.type,
                    groupValue: _sortData,
                    onChanged: (SortData value) {
                      setState(() { _sortData = value; });
                      print(value);
                    },
                  ),
                ),
              ]
            )
          ),
        );
      }
    );
  }

  void _selectStatus() {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          // title: Text("status"),
          content: Container(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: <Widget> [
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      _status = "PROSPECT";
                    });
                  },
                  child: Text("PROSPECT"),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      _status = "HOT PROSPECT";
                    });
                  },
                  child: Text("HOT PROSPECT"),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      _status = "SPK";
                    });
                  },
                  child: Text("SPK"),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      _status = "PROSES KREDIT";
                    });
                  },
                  child: Text("PROSES KREDIT"),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      _status = "PO";
                    });
                  },
                  child: Text("PO"),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      _status = "FULL DP";
                    });
                  },
                  child: Text("FULL DP"),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      _status = "DO";
                    });
                  },
                  child: Text("DO"),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      _status = "BATAL";
                    });
                  },
                  child: Text("BATAL"),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      _status = "All status";
                    });
                  },
                  child: Text("All status"),
                ),
              ]
            )
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    BaseAuth _auth = AuthProvider.of(context).auth;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorBlue,
        elevation: 0,
        title: Text("Lead ${_auth.currentUser.userId}"),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              _selectSort();
            },
            child: Container(
              padding: EdgeInsets.all(17),
              child: Image.asset(
                'assets/drawable-hdpi/Sort.png',
                height: 18,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.push(context, 
              //   MaterialPageRoute(
              //     builder: (context) => FormNewProspect()
              //   )
              // );
            },
            child: Container(
              padding: EdgeInsets.all(17),
              child: Image.asset(
                'assets/drawable-hdpi/Plus.png',
                height: 18,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: AppColors.colorDarkBlue,
            height: 80,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  _selectStatus();
                },
                child: Card(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(_status),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: FutureBuilder(
              future: fetchProspect(_auth.currentUser.userId, _auth.currentUser.authToken),
              builder: (context, snapshot){
                // print("${snapshot.data.prospectList.length}");
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData ?
                  Container(
                    child: new ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.results.length,
                      itemBuilder: (BuildContext context, i){
                        var showData = snapshot.data.results[i];
                        Color hexColor = HexColor.fromHex('${showData.color}');
                        return Container(
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                onTap: () {
                                  // Navigator.push(context, 
                                  //   MaterialPageRoute(
                                  //     builder: (context) => ProspekDetailPage(results: showData,)
                                  //   )
                                  // );
                                },
                                leading: Card(
                                  // elevation: 3.0,
                                  color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      child: Center(
                                        child: Text(
                                          "${showData.name.toUpperCase().substring(0, 1)}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                    )
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0)),
                                ),
                                title: Text(
                                  "${showData.name}"
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "${showData.phone}"
                                    ),
                                    Text(
                                      showData.customerType == 0 ? "Perorangan" : "Perusahaan"
                                    )
                                  ],
                                ),
                                trailing: Container(
                                  width: 90,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Status"
                                      ),
                                      Card(
                                        color: hexColor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "${showData.statusName}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              color: Colors.white
                                            ),
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider()
                            ],
                          ),
                        );
                      }
                    )
                  ) : new Center(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new CircularProgressIndicator(),
                        SizedBox(height: 10.0,),
                        new Text('No Data Found'),
                      ],
                    ),
                  );
              }
            ),
          )
        ],
      ),
    );
  }
}