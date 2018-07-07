import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

FlutterBlue flutterBlue = FlutterBlue.instance;

/// Start scanning
var scanSubscription = flutterBlue.scan().listen((scanResult) {
  // do something with scan result
});

// class BluetoothSearch extends StatefulWidget {
//   const BluetoothSearch({Key key}) : super(key: key);

//   @override
//   _BluetoothSearchState createState() => new _BluetoothSearchState();
// }

// class _BluetoothSearchState extends State<BluetoothSearch> {
//   FlutterBlue _flutterBlue = FlutterBlue.instance;

//     /// Scanning
//   StreamSubscription _scanSubscription;
//   Map<DeviceIdentifier, ScanResult> scanResults = new Map();
//   bool isScanning = false;

//   /// State
//   StreamSubscription _stateSubscription;
//   BluetoothState state = BluetoothState.unknown;

//   /// Device
//   BluetoothDevice device;
//   bool get isConnected => (device != null);
//   StreamSubscription deviceConnection;
//   StreamSubscription deviceStateSubscription;
//   List<BluetoothService> services = new List();
//   Map<Guid, StreamSubscription> valueChangedSubscriptions = {};
//   BluetoothDeviceState deviceState = BluetoothDeviceState.disconnected;

//   @override
//   void initState() {
//     super.initState();
//     // Immediately get the state of FlutterBlue
//     _flutterBlue.state.then((s) {
//       setState(() {
//         state = s;
//       });
//     });
//     // Subscribe to state changes
//     _stateSubscription = _flutterBlue.onStateChanged().listen((s) {
//       setState(() {
//         state = s;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _stateSubscription?.cancel();
//     _stateSubscription = null;
//     _scanSubscription?.cancel();
//     _scanSubscription = null;
//     deviceConnection?.cancel();
//     deviceConnection = null;
//     super.dispose();
//   }

//     // _startScan() {
//     // _scanSubscription = _flutterBlue
//     //     .scan(
//     //   timeout: const Duration(seconds: 5),
//     //   /*withServices: [
//     //       new Guid('0000180F-0000-1000-8000-00805F9B34FB')
//     //     ]*/
//     // )
//     //     .listen((scanResult) {
//     //   print('localName: ${scanResult.advertisementData.localName}');
//     //   print(
//     //       'manufacturerData: ${scanResult.advertisementData.manufacturerData}');
//     //   print('serviceData: ${scanResult.advertisementData.serviceData}');
//     //   setState(() {
//     //     scanResults[scanResult.device.id] = scanResult;
//     //   });
//     // }, onDone: _stopScan);

//     // setState(() {
//     //   isScanning = true;
//     // });
//   }


  // @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //     appBar: new AppBar(
  //       title: new Text("LitBit Companion App"),
  //     ),
  //     body: new Center(
  //         child: new Column(children: <Widget>[
  //       new Text(
  //         scanSubscription.toString(),
  //         textAlign: TextAlign.center,
  //         overflow: TextOverflow.ellipsis,
  //         style: new TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //     ])),
  //   );
  // }

// }
