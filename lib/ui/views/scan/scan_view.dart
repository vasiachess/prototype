import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/data/models/delivery_item.dart';
import 'package:stackedprototype/ui/views/scan/scan_viewmodel.dart';

class ScanView extends StatelessWidget {
  final DeliveryItem deliveryItem;
  const ScanView({@required this.deliveryItem});

  static const String id = 'Scan_screen';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScanViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: Text(model.title)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    FlatButton(
                      padding: EdgeInsets.all(8),
                      color: Colors.blue,
                      onPressed: () => model.decreaseQuantity(),
                      child: Text(
                        '-',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${model.quantity}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(8),
                      color: Colors.blue,
                      onPressed: () => model.increaseQuantity(),
                      child: Text(
                        '+',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              FlatButton(
                padding: EdgeInsets.all(8),
                color: Colors.blue,
                onPressed: () async {
                  await model.scanQrCode();
                },
                child: Text(
                  'Start the Scanning',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(model.scanResult),
            ],
          ),
        );
      },
      viewModelBuilder: () => ScanViewModel(deliveryItem.quantity.toInt(), deliveryItem.materialId),
    );
  }
}
