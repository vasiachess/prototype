import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/constants.dart';
import 'package:stackedprototype/ui/views/settings/settings_viewmodel.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: colorViolet,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Text(
              'Settings',
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
                onTap: () {
                  model.navigateLanguage();
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 24, 16),
                      child: Icon(
                        Icons.language,
                        color: colorTextLight,
                        size: 24,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Language',
                            style: TextStyle(
                              color: colorTextDark,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            'English',
                            style: TextStyle(
                              color: colorTextLight,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: colorTextLight,
                      size: 24,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8,),
              Divider(
                color: colorGrey,
              ),
              SizedBox(height: 16,),
              InkWell(
                onTap: () {
                  model.navigateSaveMode();
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 24, 16),
                      child: Icon(
                        Icons.done,
                        color: colorTextLight,
                        size: 24,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Survey Save Mode',
                            style: TextStyle(
                              color: colorTextDark,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            'Save immediately',
                            style: TextStyle(
                              color: colorTextLight,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: colorTextLight,
                      size: 24,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Divider(
                color: colorGrey,
                thickness: 8,
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  model.clearData();
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Clear data',
                            style: TextStyle(
                              color: colorTextDark,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            'Clear the survey data saved in this device',
                            style: TextStyle(
                              color: colorTextLight,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                ),
              ),
              Divider(
                color: colorGrey,
              ),
              InkWell(
                onTap: () {
                  model.checkUpdates();
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Check for updates',
                        style: TextStyle(
                          color: colorTextDark,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        'Version: 1.0.9',
                        style: TextStyle(
                          color: colorTextLight,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => SettingsViewModel(),
    );
  }
}
