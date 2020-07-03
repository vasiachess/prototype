import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text(model.title)),
            SizedBox(
              height: 24,
            ),
            FlatButton(
              padding: EdgeInsets.all(8),
              color: Colors.blue,
              onPressed: () {
                model.navigateToPostList();
              },
              child: Text('Show list of posts', style: TextStyle(color: Colors.white),),
            ),
            SizedBox(
              height: 24,
            ),
            FlatButton(
              padding: EdgeInsets.all(8),
              color: Colors.blue,
              onPressed: () => model.scanQrCode(),
              child: Text('Scan QR code', style: TextStyle(color: Colors.white),),
            ),
            SizedBox(
              height: 24,
            ),
            Text(model.scanResult),
            
          ],
        ),
        floatingActionButton:
            FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: model.updateCounter,),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
