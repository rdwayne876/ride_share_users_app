import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CommonMethods {
  checkConnectivity(BuildContext context) async {
    var connection = await Connectivity().checkConnectivity();

    if(connection != ConnectivityResult.mobile && connection != ConnectivityResult.wifi) {
      if(!context.mounted) return;
      displaySnackBar("No Internet, Check Connection and Try Again", context);
    }
  }

  displaySnackBar(String message, BuildContext context) {
    var snackBar = SnackBar(content: Text(message));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}