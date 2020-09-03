import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/constants.dart';
import 'package:stackedprototype/ui/views/settings_language/settings_language_viewmodel.dart';

class SettingsLanguageView extends StatelessWidget {

  const SettingsLanguageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsLanguageViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: colorViolet,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Text(
              'Language',
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
                  onTap: () { model.setEnglish(); },
                  child: Row(
                    children: [
                      SizedBox(width: 16,),
                      Image.asset(model.isEnglish ? 'assets/images/ic_radio_on.png' : 'assets/images/ic_radio_off.png', width: 48,),
                      SizedBox(width: 8,),
                      Text(
                        'English',
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
                onTap: () { model.setArabic(); },
                child: Row(
                    children: [
                      SizedBox(width: 16,),
                      Image.asset(model.isEnglish ? 'assets/images/ic_radio_off.png' : 'assets/images/ic_radio_on.png', width: 48,),
                      SizedBox(width: 8,),
                      Text(
                        'Arabic',
                        style: TextStyle(
                          color: colorTextDark,
                          fontSize: 16,
                        ),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 16,),
              Divider(
                color: colorGrey,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: Text(
                  'Restart application to see the language changes effective',
                  style: TextStyle(
                    color: colorTextLight,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => SettingsLanguageViewModel(),
    );
  }
}
