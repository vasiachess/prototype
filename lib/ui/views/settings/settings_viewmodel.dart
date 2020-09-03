import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/app/router.gr.dart';

class SettingsViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final _dialogService = locator<DialogService>();


  Future navigateLanguage() async {
    await _navigationService.navigateTo(Routes.settingsLanguageView);
  }

  Future navigateSaveMode() async {
    await _navigationService.navigateTo(Routes.settingsSaveModeView);
  }

  Future clearData() async {

    DialogResponse dialogResponse = await _dialogService.showConfirmationDialog(
      title: 'Clear survey data?',
      description: 'Are you sure that you want to clear all unsynchronized survey data saved in this device?\nThis action can not be undone.',
      barrierDismissible: true,
      dialogPlatform: DialogPlatform.Cupertino,
      confirmationTitle: 'Clear Data',
      cancelTitle: 'Cancel'
    );

    if (dialogResponse.confirmed) {
      // make some action
    }

  }

  Future checkUpdates() {

  }

}
