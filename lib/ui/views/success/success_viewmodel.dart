
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/app/router.gr.dart';

class SuccessViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();

  Future navigateHome() async {
    await _navigationService.navigateTo(Routes.homeViewRoute);
  }

}
