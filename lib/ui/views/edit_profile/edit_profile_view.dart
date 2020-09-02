import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/constants.dart';
import 'package:stackedprototype/ui/views/edit_profile/edit_profile_viewmodel.dart';
import 'package:stackedprototype/ui/views/more/more_viewmodel.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: colorGreyCountdown,
          appBar: AppBar(
            backgroundColor: colorViolet,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Text(
              'Edit Profile',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            elevation: 3.0,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 24,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 47,
                    backgroundImage: AssetImage('assets/images/ic_order_success.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: (){
                    model.changePhoto();
                  },
                  child: Text(
                    'Change Profile Photo',
                    style: TextStyle(
                      color: colorTextDark,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 32, 24, 8),
                        child: Text(
                          'First name',
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
                            decoration: kTextFieldDecoration.copyWith(prefixIcon: Icon(Icons.person, color: colorTextLight,),),
                            onChanged: (value) {

                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                        child: Text(
                          'Last name',
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
                            decoration: kTextFieldDecoration.copyWith(prefixIcon: Icon(Icons.person, color: colorTextLight,),),
                            onChanged: (value) {

                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                        child: Text(
                          'Email',
                          style: TextStyle(
                              color: colorTextLight,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                        child: Container(
                          height: 56,
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(fontSize: 16),
                            decoration: kTextFieldDecoration.copyWith(prefixIcon: Icon(Icons.email, color: colorTextLight,),),
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
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => EditProfileViewModel(),
    );
  }
}
