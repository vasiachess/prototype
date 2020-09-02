import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/app/router.gr.dart';

class MoreViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();

  Future navigateEditProfile() async {
    await _navigationService.navigateTo(Routes.editProfileView);
  }

  Future navigateSettings() async {
    await _navigationService.navigateTo(Routes.settingsView);
  }

  Future navigateSupport() async {
    await _navigationService.navigateTo(Routes.settingsView);
  }

  Future navigateChangePassword() async {
    await _navigationService.navigateTo(Routes.changePasswordView);
  }

  Future logOut() async {

  }

}
