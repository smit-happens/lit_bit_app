import 'package:flutter/material.dart';

import 'package:flutter_blue/flutter_blue.dart';

FlutterBlue flutterBlue = FlutterBlue.instance;

/// Start scanning
var scanSubscription = flutterBlue.scan().listen((scanResult) {
  // do something with scan result
});

class BluetoothSearch extends StatefulWidget {
  const BluetoothSearch({Key key}) : super(key: key);

  @override
  _BluetoothSearchState createState() => new _BluetoothSearchState();
}

class _BluetoothSearchState extends State<BluetoothSearch> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("LitBit Companion App"),
      ),
      body: new Center(
          child: new Column(children: <Widget>[
        new Text(
          scanSubscription.toString(),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: new TextStyle(fontWeight: FontWeight.bold),
        ),
      ])),
    );
  }
}
