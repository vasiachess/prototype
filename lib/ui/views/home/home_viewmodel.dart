import 'package:barcode_scan/barcode_scan.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String _title = 'Home View';
  String get title => '$_title $_counter';

  String _scanResult = '';
  String get scanResult => _scanResult;

  int _counter = 0;
  int get counter => _counter;

  void updateCounter() {
    _counter++;
    notifyListeners();
  }

  Future<void> scanQrCode() async {
    var result = await BarcodeScanner.scan();
    _scanResult = 'QR code content: ${result.rawContent}';
    notifyListeners();
  }

}
