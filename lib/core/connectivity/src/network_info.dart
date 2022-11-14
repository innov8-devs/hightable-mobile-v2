import 'package:cross_connectivity/cross_connectivity.dart';

abstract class NetworkInfo {
  Future<bool> get isDeviceConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this._connectivity);
  late final Connectivity? _connectivity;

  @override
  Future<bool> get isDeviceConnected => _connectivity!.checkConnection();
}
