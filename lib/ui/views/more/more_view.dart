import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/constants.dart';
import 'package:stackedprototype/ui/views/more/more_viewmodel.dart';

class MoreView extends StatelessWidget {
  const MoreView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MoreViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: colorViolet,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 48,
              ),
              InkWell(
                onTap: () {
                  model.navigateEditProfile();
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage('assets/images/ic_order_success.png'),
                    ),
                  ),
                  title: Text(
                    'Martin Lubin',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      'martin.lubin@gmail.com',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 24,
                      ),
                      InkWell(
                        onTap: (){
                          model.navigateSettings();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            children: [
                              SizedBox(width: 20,),
                              Icon(Icons.settings, color: colorTextLight, size: 24,),
                              SizedBox(width: 24,),
                              Text(
                                'Settings',
                                style: TextStyle(
                                  color: colorTextDark,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {model.navigateSupport();},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            children: [
                              SizedBox(width: 20,),
                              Icon(Icons.live_help, color: colorTextLight, size: 24,),
                              SizedBox(width: 24,),
                              Text(
                                'Support',
                                style: TextStyle(
                                  color: colorTextDark,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {model.navigateChangePassword();},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            children: [
                              SizedBox(width: 20,),
                              Icon(Icons.lock, color: colorTextLight, size: 24,),
                              SizedBox(width: 24,),
                              Text(
                                'Change password',
                                style: TextStyle(
                                  color: colorTextDark,
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
                        onTap: (){model.logOut();},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            children: [
                              SizedBox(width: 20,),
                              Image.asset('assets/images/ic_log_out.png', width: 24,),
                              SizedBox(width: 24,),
                              Text(
                                'Log out',
                                style: TextStyle(
                                  color: colorTextDark,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
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
      viewModelBuilder: () => MoreViewModel(),
    );
  }
}
