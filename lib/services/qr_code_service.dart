import 'package:barcode_scan/barcode_scan.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class QrCodeService {

  String _scanResult = '';
  String get scanResult => _scanResult;


  Future<String> scanQrCode() async {
    var result = await BarcodeScanner.scan();
    _scanResult = 'QR code content: ${result.rawContent}';
    return _scanResult;
  }


}