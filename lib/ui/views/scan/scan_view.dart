import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/constants.dart';
import 'package:stackedprototype/data/models/delivery_item.dart';
import 'package:stackedprototype/ui/views/scan/scan_viewmodel.dart';

class ScanView extends StatelessWidget {
  final DeliveryItem deliveryItem;
  final int deliveryId;
  const ScanView({@required this.deliveryId, @required this.deliveryItem});

  static const String id = 'Scan_screen';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScanViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: colorViolet,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Text(
              deliveryItem.materialNameEn,
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            elevation: 3.0,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                child: Text(
                  deliveryItem.materialNameEn,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: colorTextDark, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Text(
                      'PD: $deliveryId',
                      style: TextStyle(
                        color: colorTextLight,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      '${model.serialNumbers.length}/${deliveryItem.quantity.toInt()}',
                      style: TextStyle(
                        color: colorTextDark,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      ' pcs',
                      style: TextStyle(
                        color: colorTextLight,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Divider(
                  color: colorGrey,
                ),
              ),
              Visibility(
                visible: model.scanResult.isEmpty,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'How many items would you like to scan?',
                    style: TextStyle(
                      color: colorTextDark,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: model.scanResult.isEmpty,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () => model.decreaseQuantity(),
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(shape: BoxShape.rectangle, color: colorGrey, borderRadius: BorderRadius.all(Radius.circular(3))),
                          child: Center(
                            child: Text(
                              '-',
                              style: TextStyle(color: colorViolet, fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle, border: Border.all(color: colorGrey), borderRadius: BorderRadius.all(Radius.circular(2.5))),
                          child: Center(
                            child: Text(
                              '${model.quantity}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () => model.increaseQuantity(),
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(shape: BoxShape.rectangle, color: colorGrey, borderRadius: BorderRadius.all(Radius.circular(3))),
                          child: Center(
                            child: Text(
                              '+',
                              style: TextStyle(color: colorViolet, fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: colorGreyShadow, spreadRadius: 2, blurRadius: 5, // changes position of shadow
                      ),
                    ],
                  ),
                  child: model.scanResult.isEmpty ?
                   Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/ic_order_complete.png',
                            width: 156,
                          ),
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Image.asset(
                                    'assets/images/ic_circle.png',
                                    width: 110,
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          '${model.quantity}',
                                          style: TextStyle(
                                            color: colorTextDark,
                                            fontSize: 36,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'pcs',
                                          style: TextStyle(
                                            color: colorTextLight,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: colorGrey,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(12),
                        color: colorViolet,
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () async {
                          await model.scanQrCode();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/ic_qr_code.png',
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Start the Scanning',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  )
                  : Column(
                    children: <Widget>[
                      CircularCountdown(
                        countdownTotal:  model.quantity,
                        countdownRemaining:  model.quantity - model.serialNumbers.length,
                        countdownCurrentColor: colorGreyCountdown,
                        countdownRemainingColor: colorGreyCountdown,
                        countdownTotalColor: colorViolet,
                        diameter: 150,
                        gapFactor: 0.5,
                        strokeWidth: 6,
                        textStyle: TextStyle(
                          color: colorTextDark,
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Image.asset(
                        'assets/images/ic_order_complete.png',
                        height: 190,
                      ),
                    ],
                  )
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => ScanViewModel(deliveryId, deliveryItem.id, deliveryItem.quantity.toInt(), deliveryItem.materialId),
    );
  }
}
