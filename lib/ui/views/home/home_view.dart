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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(child: Text(model.title)),
            SizedBox(
              height: 24,
            ),
            FlatButton(
              padding: EdgeInsets.all(8),
              color: Colors.blue,
              onPressed: () {
                model.loginUser();
              },
              child: Text('Login', style: TextStyle(color: Colors.white),),
            ),
            FlatButton(
              padding: EdgeInsets.all(8),
              color: Colors.blue,
              onPressed: () {
                model.loginWithAzureAD('27310a22-9182-45d6-a31b-3000633c63f0', '5d6db3ab-8bf9-4c62-aa7e-0db78a7970f3');
              },
              child: Text('Login with Azure AD', style: TextStyle(color: Colors.white),),
            ),
            Text(model.sessionId),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatButton(
                    padding: EdgeInsets.all(8),
                    color: Colors.blue,
                    onPressed: () => model.navigateToMore(),
                    child: Text('More', style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(8),
                    color: Colors.blue,
                    onPressed: () => model.navigateToImageFooter(),
                    child: Text('Image Footer', style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.all(8),
                  color: Colors.blue,
                  onPressed: () {
                    model.navigateToPurchaseOrders();
                  },
                  child: Text('Show purchase orders', style: TextStyle(color: Colors.white),),
                ),
                SizedBox(
                  width: 16
                ),
                FlatButton(
                  padding: EdgeInsets.all(8),
                  color: Colors.blue,
                  onPressed: () {
                    model.navigateToPurchaseDelivery();
                  },
                  child: Text('Show purchase delivery', style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            FlatButton(
              padding: EdgeInsets.all(8),
              color: Colors.blue,
              onPressed: () {
                model.navigateToSupplierPurchaseDelivery();
              },
              child: Text('Show supplier purchase delivery', style: TextStyle(color: Colors.white),),
            ),
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
