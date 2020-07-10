import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/app/router.gr.dart';
import 'package:stackedprototype/services/api.dart';
import 'package:stackedprototype/services/qr_code_service.dart';

class HomeViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final _qrCodeService = locator<QrCodeService>();
  final _api = locator<Api>();

  String _title = 'Home View';
  String get title => '$_title $_counter';

  String _scanResult = '';
  String get scanResult => _scanResult;

  String _sessionId = '';
  String get sessionId => _sessionId;

  int _counter = 0;
  int get counter => _counter;

  void updateCounter() {
    _counter++;
    notifyListeners();
  }

  Future navigateToPostList() async {
    await _navigationService.navigateTo(Routes.postListView);
  }

  Future navigateToPurchaseOrders() async {
    await _navigationService.navigateTo(Routes.purchaseOrdersView);
  }

  Future navigateToPurchaseDelivery() async {
    await _navigationService.navigateTo(Routes.purchaseDeliveryView);
  }

  Future scanQrCode() async {
    _scanResult = await runBusyFuture(_qrCodeService.scanQrCode());
  }

  Future loginUser() async {
    final response = await runBusyFuture(_api.postAuthenticate());
    if (response != null) {
      _sessionId = response;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('sessionId', _sessionId);
    }
  }

}
