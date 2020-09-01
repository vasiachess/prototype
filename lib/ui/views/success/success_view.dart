import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/constants.dart';

import 'success_viewmodel.dart';

class SuccessView extends StatelessWidget {
  final int itemsCount;
  final List<String> serialNotImported;
  const SuccessView({@required this.itemsCount, @required this.serialNotImported});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SuccessViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(60, 40, 60, 24),
              child: Image.asset(
                'assets/images/ic_order_success.png',
              ),
            ),
            Text(
              'Great job!',
              textAlign: TextAlign.start,
              style: TextStyle(color: colorTextDark, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            RichText(
              text: TextSpan(
                  text: 'You have successfully scanned ',
                  style: TextStyle(
                      color: colorTextDark, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(text: '$itemsCount',
                      style: TextStyle(
                        color: colorTextDark,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: ' items',
                      style: TextStyle(
                        color: colorTextDark,
                        fontSize: 16,
                      ),
                    )
                  ]
              ),
            ),
            SizedBox(
              height: 56,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FlatButton(
                padding: EdgeInsets.fromLTRB(60, 12, 60, 12),
                color: colorViolet,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {
                  model.navigateHome();
                },
                child: Text(
                  'Awesome!',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => SuccessViewModel(),
    );
  }
}
