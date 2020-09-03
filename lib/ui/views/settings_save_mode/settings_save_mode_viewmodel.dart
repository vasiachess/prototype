import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';

class SettingsSaveModeViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  bool _saveOffline = true;
  bool get saveOffline => _saveOffline;

  void setOffline() {
    _saveOffline = true;
    notifyListeners();
  }

  void setImmediately() {
    _saveOffline = false;
    notifyListeners();
  }
}
