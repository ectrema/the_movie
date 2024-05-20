import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class ConnectivityService {
  final ValueNotifier<bool> _isConnected;

  ValueNotifier<bool> get isConnected => _isConnected;

  ConnectivityService._(bool isConnected)
      : _isConnected = ValueNotifier<bool>(isConnected) {
    _init();
  }

  @FactoryMethod(preResolve: true)
  static Future<ConnectivityService> inject() async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    return ConnectivityService._(
      connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi),
    );
  }

  void _init() {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> connectivityResult) {
      _isConnected.value =
          connectivityResult.contains(ConnectivityResult.mobile) ||
              connectivityResult.contains(ConnectivityResult.wifi);
    });
  }
}
