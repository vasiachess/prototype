import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/app/router.gr.dart';
import 'package:stackedprototype/services/qr_code_service.dart';

class HomeViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final _qrCodeService = locator<QrCodeService>();

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

  Future navigateToPostList() async {
    await _navigationService.navigateTo(Routes.postListView);
  }

  Future navigateToPurchaseOrders() async {
    await _navigationService.navigateTo(Routes.purchaseOrdersView);
  }

  Future scanQrCode() async {
    _scanResult = await runBusyFuture(_qrCodeService.scanQrCode());
  }

}
