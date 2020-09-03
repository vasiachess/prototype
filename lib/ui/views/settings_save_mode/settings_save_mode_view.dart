import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/constants.dart';
import 'package:stackedprototype/ui/views/settings_save_mode/settings_save_mode_viewmodel.dart';

class SettingsSaveModeView extends StatelessWidget {

  const SettingsSaveModeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsSaveModeViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: colorViolet,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Text(
              'Survey Save Mode',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            elevation: 3.0,
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 24,),
              InkWell(
                onTap: () { model.setOffline(); },
                child: Row(
                    children: [
                      SizedBox(width: 16,),
                      Image.asset(model.saveOffline ? 'assets/images/ic_radio_on.png' : 'assets/images/ic_radio_off.png', width: 48,),
                      SizedBox(width: 8,),
                      Text(
                        'Save offline and then submit later',
                        style: TextStyle(
                          color: colorTextDark,
                          fontSize: 16,
                        ),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 16,),
              InkWell(
                onTap: () { model.setImmediately(); },
                child: Row(
                    children: [
                      SizedBox(width: 16,),
                      Image.asset(model.saveOffline ? 'assets/images/ic_radio_off.png' : 'assets/images/ic_radio_on.png', width: 48,),
                      SizedBox(width: 8,),
                      Text(
                        'Save immediately',
                        style: TextStyle(
                          color: colorTextDark,
                          fontSize: 16,
                        ),
                      ),
                    ]
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => SettingsSaveModeViewModel(),
    );
  }
}
