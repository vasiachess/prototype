import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/data/models/order.dart';
import 'package:stackedprototype/ui/views/purchase_orders_items/purchase_order_items_viewmodel.dart';

class PurchaseOrderItemsView extends StatelessWidget {
  final Order order;
  const PurchaseOrderItemsView({@required this.order});
  static const String id = 'purchase_order_items_screen';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PurchaseOrderItemsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
            itemCount: order.orderItems.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(order.orderItems[index].name),
              subtitle: Text('Ordered: ${order.orderItems[index].orderedQty}, received: ${order.orderItems[index].receivedQty}'),
              trailing: Text(order.dateOrder),
            )),
      ),
      viewModelBuilder: () => PurchaseOrderItemsViewModel(),
    );
  }
}
