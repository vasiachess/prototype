import 'dart:convert';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/data/models/qr_code_model.dart';
import 'package:stackedprototype/services/api.dart';
import 'package:stackedprototype/services/qr_code_service.dart';

class ScanViewModel extends BaseViewModel {

  ScanViewModel(this._quantity, this._materialId,);

  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final _qrCodeService = locator<QrCodeService>();
  final _api = locator<Api>();

  String _title = 'Scan View';
  String get title => '$_title $_quantity';

  String _scanResult = '';
  String get scanResult => _scanResult;

  int _quantity = 0;
  int get quantity => _quantity;

  int _materialId = 0;
  int get materialId => _materialId;

  void updateQuantity(int value) {
    _quantity = value;
    notifyListeners();
  }

  void decreaseQuantity() {
    --_quantity;
    notifyListeners();
  }

  void increaseQuantity() {
    ++_quantity;
    notifyListeners();
  }

  Future<String> scanQrCode() async {

    int scannedCount = 0;
    while (scannedCount < quantity) {
      _scanResult = await runBusyFuture(_qrCodeService.scanQrCode());

      if (_scanResult.isEmpty) break;

      var parsed = json.decode(_scanResult);
      QrCodeModel qrCodeModel= QrCodeModel.fromJson(parsed);
      if (_materialId == qrCodeModel.materialId) {
        showSnackBar('Item $scannedCount scanned');
        scannedCount++;
      } else {
        showSnackBar('Wrong item, try another');
      }

      await Future.delayed(const Duration(seconds: 1));
    }
    return _scanResult;
  }

  Future showSnackBar( String message) async {
    _snackbarService.showSnackbar(
      message: message,
      duration: const Duration(seconds: 1),);
  }

}
