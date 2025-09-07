import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectionService {
  factory ConnectionService() => _instance;
  
  ConnectionService._internal();
  
  static final ConnectionService _instance = ConnectionService._internal();

  final InternetConnection _connection = InternetConnection();
  
  bool _isConnected = true;
  StreamController<bool>? _connectionController;

  /// Get current connection status
  bool get isConnected => _isConnected;

  /// Stream of connection status changes
  Stream<bool> get connectionStream {
    _connectionController ??= StreamController<bool>.broadcast();
    return _connectionController!.stream;
  }

  /// Initialize connection monitoring
  void initialize() {
    _connection.onStatusChange.listen((status) {
      final wasConnected = _isConnected;
      _isConnected = status == InternetStatus.connected;
      
      // Only emit if status changed
      if (wasConnected != _isConnected) {
        _connectionController?.add(_isConnected);
        debugPrint('🌐 ConnectionService: Internet status changed: $_isConnected');
      }
    });
  }

}
