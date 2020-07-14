import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/data/models/qr_code_model.dart';
import 'package:stackedprototype/data/models/receive_delivery_items_request_model.dart';
import 'package:stackedprototype/services/api.dart';
import 'package:stackedprototype/services/qr_code_service.dart';

class ScanViewModel extends BaseViewModel {

  ScanViewModel(this._deliveryId, this._id, this._quantity, this._materialId,);

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

  int _id = 0;
  int get id => _id;

  int _deliveryId = 0;
  int get deliveryId => _deliveryId;

  List<String> serialNumbers = [];

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

    while (serialNumbers.length < quantity) {
      _scanResult = await runBusyFuture(_qrCodeService.scanQrCode());

      if (_scanResult.isEmpty) break;

      var parsed = json.decode(_scanResult);
      QrCodeModel qrCodeModel = QrCodeModel.fromJson(parsed);
      if (_materialId == qrCodeModel.materialId) {
        showSnackBar('Item ${serialNumbers.length} has been scanned');
        if (qrCodeModel.serialNumber != null) {
          if (serialNumbers.contains(qrCodeModel.serialNumber)) {
            showSnackBar('This item has already been scanned');
          } else {
            serialNumbers.add(qrCodeModel.serialNumber);
          }
        } else {
          showSnackBar('No serial number on this item, try another');
        }
      } else {
        showSnackBar('Wrong item, try another');
      }

      await Future.delayed(const Duration(seconds: 1));
    }

    if (serialNumbers.length == quantity) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final sessionId = prefs.getString('sessionId');
      _scanResult = await locator<Api>().receiveDeliveryItems(sessionId, ReceiveDeliveryItemsRequestModel(params: Params(pickings: [
        Pickings(id: deliveryId, deliveryItems: [DeliveryItem(id: id, materialId: materialId, materialQty: quantity, scannedSerialNumbers: serialNumbers)])
      ])));
    }

    return _scanResult;
  }

  Future showSnackBar(String message) async {
    _snackbarService.showSnackbar(message: message, duration: const Duration(seconds: 1),);
  }

}
