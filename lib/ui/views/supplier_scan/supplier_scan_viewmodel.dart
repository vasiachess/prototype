import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/app/router.gr.dart';
import 'package:stackedprototype/constants.dart';
import 'package:stackedprototype/data/models/receive_supplier_delivery_items_request_model.dart';
import 'package:stackedprototype/services/api.dart';
import 'package:stackedprototype/services/qr_code_service.dart';

class SupplierScanViewModel extends BaseViewModel {
  SupplierScanViewModel(
    this._deliveryId,
    this._id,
    this._quantity,
    this._materialId,
  );

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
    if (_quantity > 1) {
      --_quantity;
      notifyListeners();
    }
  }

  void increaseQuantity() {
    ++_quantity;
    notifyListeners();
  }

  Future<String> scanQrCode() async {
    while (serialNumbers.length < quantity) {
      _scanResult = await runBusyFuture(_qrCodeService.scanQrCode());

      if (_scanResult.isEmpty) break;

//      var parsed = json.decode(_scanResult);
//      QrCodeModel qrCodeModel = QrCodeModel.fromJson(parsed);
//      if (_materialId == qrCodeModel.materialId) {
//        showSnackBar('Item ${serialNumbers.length} has been scanned');
//        if (qrCodeModel.serialNumber != null) {
//          if (serialNumbers.contains(qrCodeModel.serialNumber)) {
//            showSnackBar('This item has already been scanned');
//          } else {
//            serialNumbers.add(qrCodeModel.serialNumber);
//          }
//        } else {
//          showSnackBar('No serial number on this item, try another');
//        }
//      } else {
//        showSnackBar('Wrong item, try another');
//      }

      if (serialNumbers.contains(_scanResult)) {
        showSnackBar('This item has already been scanned');
      } else {
        serialNumbers.add(_scanResult);
      }

      if (serialNumbers.length < quantity) {
        await Future.delayed(const Duration(seconds: 2));
      }
    }

    if (serialNumbers.length == quantity) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final sessionId = prefs.getString('sessionId');
      final response = await _api.receiveSupplierDeliveryItems(
          sessionId,
          ReceiveSupplierDeliveryItemsRequestModel(
              params: Params(pickings: [ Pickings(
                id: deliveryId,
                deliveryItems: [DeliveryItem(id: id, materialId: materialId, materialQty: quantity, scannedSerialNumbers: serialNumbers)])
          ])));

      if (response == null) {
        showSnackBar('Something went wrong');
      } else if (response.result.status.toLowerCase() == 'success') {
        navigateSuccess(quantity);
      } else {
        _scanResult = '';
        serialNumbers.clear();
        showSnackBar('Error: ${response.result.error}');
        notifyListeners();
      }
    }

    return _scanResult;
  }

  Future showSnackBar(String message) async {
    _snackbarService.showCustomSnackBar(
      message: message,
      messageText: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      icon: Icon(Icons.report, color: Colors.white),
      backgroundColor: colorRed,
      duration: const Duration(seconds: 2),
    );
  }

  Future navigateSuccess(int itemsCount) async {
    await _navigationService.navigateTo(Routes.successView, arguments: SuccessViewArguments(itemsCount: itemsCount));
  }
}
