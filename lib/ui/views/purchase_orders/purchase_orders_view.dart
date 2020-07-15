import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/constants.dart';
import 'package:stackedprototype/data/models/expandable_list_item.dart';
import 'package:stackedprototype/ui/components/expandable_list_view.dart';
import 'package:stackedprototype/ui/views/purchase_orders/purchase_orders_viewmodel.dart';

class PurchaseOrdersView extends StatelessWidget {
  const PurchaseOrdersView({Key key}) : super(key: key);
  static const String id = 'purchase_orders_screen';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PurchaseOrdersViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: colorViolet,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            'Purchase orders',
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          elevation: 3.0,
          centerTitle: true,
        ),
        body: model.isBusy
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: colorGreyShadow, spreadRadius: 2, blurRadius: 5, // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        20,
                        10,
                        10,
                      ),
                      child: Text(
                        'PURCHASE ORDERS',
                        style: TextStyle(
                          color: colorTextLight,
                          letterSpacing: 1.5,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Divider(
                      color: colorGrey,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        0,
                        20,
                        20,
                      ),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                '${model.data.length}',
                                style: TextStyle(
                                  color: colorViolet,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Pending',
                                style: TextStyle(
                                  color: colorTextDark,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Image.asset(
                            'assets/images/ic_orders.png',
                            width: 137,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: colorGreyShadow, spreadRadius: 2, blurRadius: 5, // changes position of shadow
                    ),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.data.length,
                  itemBuilder: (context, index) => ExpandableListView(
                    expandableListItem: ExpandableListItem.fromPurchaseOrder(model.data[index]),
                    onPressed: (itemIndex) {
//                      model.navigateToScanView(model.data[index].id, model.data[index].deliveryItems[itemIndex]);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),

//        body: model.isBusy
//            ? Center(
//          child: CircularProgressIndicator(),
//        )
//            : ListView.builder(
//            itemCount: model.data.length,
//            itemBuilder: (context, index) => ListTile(
//              title: Text(model.data[index].order.supplier),
//              subtitle: Text(model.data[index].order.dateOrder),
//              trailing: Text(model.data[index].order.name),
//              onTap: (){
//                model.navigateToPurchaseOrderItems(model.data[index].order);
//              },
//            )),
      ),
      viewModelBuilder: () => PurchaseOrdersViewModel(),
    );
  }
}
