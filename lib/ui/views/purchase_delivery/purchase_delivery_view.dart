import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/ui/views/purchase_delivery/purchase_delivery_viewmodel.dart';

class PurchaseDeliveryView extends StatelessWidget {
  const PurchaseDeliveryView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PurchaseDeliveryViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
            itemCount: model.data.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(model.data[index].deliveryItems[0].materialNameEn),
              subtitle: Text(model.data[index].deliveryItems[0].warehouse),
              trailing: Text(model.data[index].deliveryItems[0].quantity.toString()),
              onTap: (){
                model.navigateToScanView(model.data[index].id, model.data[index].deliveryItems[0]);
              },
            )),
      ),
      viewModelBuilder: () => PurchaseDeliveryViewModel(),
    );
  }
}
