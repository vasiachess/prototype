import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/app/router.gr.dart';
import 'package:stackedprototype/constants.dart';
import 'package:stackedprototype/data/models/receive_delivery_items_request_model.dart';
import 'package:stackedprototype/services/api.dart';
import 'package:stackedprototype/services/qr_code_service.dart';

class ChangePasswordViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();


  Future navigateSuccess(int itemsCount) async {
    await _navigationService.navigateTo(Routes.successView);
  }
}
