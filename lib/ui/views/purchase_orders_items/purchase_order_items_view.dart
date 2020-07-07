import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/ui/views/purchase_orders_items/purchase_order_items_viewmodel.dart';

class PurchaseOrderItemsView extends StatelessWidget {
  const PurchaseOrderItemsView({Key key}) : super(key: key);
  static const String id = 'posts_screen';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PurchaseOrderItemsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
            itemCount: model.data.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(model.data[index].materialItem.nameEn),
              subtitle: Text('Ordered: ${model.data[index].quantityOrdered}, received: ${model.data[index].quantityReceived}'),
              trailing: Text(model.data[index].materialItem.unitOfMeasure),
            )),
      ),
      viewModelBuilder: () => PurchaseOrderItemsViewModel(),
    );
  }
}
