import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/ui/views/settings_save_mode/settings_save_mode_viewmodel.dart';

class SettingsSaveModeView extends StatelessWidget {

  const SettingsSaveModeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsSaveModeViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

            ],
          ),
        );
      },
      viewModelBuilder: () => SettingsSaveModeViewModel(),
    );
  }
}
