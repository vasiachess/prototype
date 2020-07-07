import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/ui/views/purchase_orders/purchase_orders_viewmodel.dart';

class PurchaseOrdersView extends StatelessWidget {
  const PurchaseOrdersView({Key key}) : super(key: key);
  static const String id = 'posts_screen';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PurchaseOrdersViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
            itemCount: model.data.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(model.data[index].supplier),
              subtitle: Text(model.data[index].orderDate),
              trailing: Text(model.data[index].id),
              onTap: (){
                model.navigateToPurchaseOrderItems(model.data[index].id);
              },
            )),
      ),
      viewModelBuilder: () => PurchaseOrdersViewModel(),
    );
  }
}
