import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/constants.dart';
import 'package:stackedprototype/ui/views/change_password/change_password_viewmodel.dart';

class ChangePasswordView extends StatelessWidget {

  const ChangePasswordView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangePasswordViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: colorViolet,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Text(
              'Change Password',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            elevation: 3.0,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 24,
                    ),
                    Center(child: Image.asset('assets/images/ic_key.png', width: 100,)),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 32, 24, 8),
                      child: Text(
                        'Old Password',
                        style: TextStyle(
                            color: colorTextLight,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        height: 56,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(fontSize: 16),
                          decoration: kTextFieldDecoration.copyWith(prefixIcon: Icon(Icons.lock, color: colorTextLight,),),
                          onChanged: (value) {

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                      child: Text(
                        'New Password',
                        style: TextStyle(
                            color: colorTextLight,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        height: 56,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(fontSize: 16),
                          decoration: kTextFieldDecoration.copyWith(prefixIcon: Icon(Icons.lock, color: colorTextLight,),),
                          onChanged: (value) {

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                      child: Text(
                        'Confirm New Password',
                        style: TextStyle(
                            color: colorTextLight,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 48),
                      child: Container(
                        height: 56,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(fontSize: 16),
                          decoration: kTextFieldDecoration.copyWith(prefixIcon: Icon(Icons.lock, color: colorTextLight,),),
                          onChanged: (value) {

                          },
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: FlatButton(
                          padding: EdgeInsets.fromLTRB(60, 12, 60, 12),
                          color: colorViolet,
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: () {
                            model.navigateMore();
                          },
                          child: Text(
                            'Save',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                  ],
                ),
              ),
        );
      },
      viewModelBuilder: () => ChangePasswordViewModel(),
    );
  }
}
