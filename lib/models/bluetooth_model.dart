import 'package:flutter/material.dart';

import 'package:flutter_blue/flutter_blue.dart';


FlutterBlue flutterBlue = FlutterBlue.instance;

/// Start scanning
var scanSubscription = flutterBlue.scan().listen((scanResult) {
    // do something with scan result
    scanResult.toString();
});