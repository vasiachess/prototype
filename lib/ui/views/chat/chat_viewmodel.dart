
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';


class ChatViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  void onSearchTextChanged(String value) {
  }

  void navigateChatMessages() {

  }

  Future getChats() {

  }

  Future showDeleteDialog() async {

    DialogResponse dialogResponse = await _dialogService.showConfirmationDialog(
        title: 'Delete Chat',
        description: 'Are you sure you want to delete the chat?\nThis action can not be undone.',
        barrierDismissible: true,
        dialogPlatform: DialogPlatform.Cupertino,
        confirmationTitle: 'Delete',
        cancelTitle: 'Cancel'
    );

    if (dialogResponse.confirmed) {
      // delete chat
    }

  }

}

