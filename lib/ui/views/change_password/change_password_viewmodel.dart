import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/app/router.gr.dart';

class ChangePasswordViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();


  Future navigateMore() async {
    await _navigationService.navigateTo(Routes.moreView);
  }
}
