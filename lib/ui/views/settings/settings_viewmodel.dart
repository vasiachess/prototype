import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/app/router.gr.dart';

class SettingsViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();


  Future navigateLanguage() async {
    await _navigationService.navigateTo(Routes.settingsLanguageView);
  }

  Future navigateSaveMode() async {
    await _navigationService.navigateTo(Routes.settingsSaveModeView);
  }

  Future clearData() {

  }

  Future checkUpdates() {

  }

}
