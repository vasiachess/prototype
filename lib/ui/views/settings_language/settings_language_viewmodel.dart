import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/app/router.gr.dart';

class SettingsLanguageViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  bool _isEnglish = true;
  bool get isEnglish => _isEnglish;

  void setEnglish() {
    _isEnglish = true;
    notifyListeners();
  }

  void setArabic() {
    _isEnglish = false;
    notifyListeners();
  }

  Future navigateSuccess(int itemsCount) async {
    await _navigationService.navigateTo(Routes.successView);
  }
}
