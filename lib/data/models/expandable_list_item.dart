import 'package:stackedprototype/data/models/expandable_item.dart';
import 'package:stackedprototype/data/models/purchase_delivery.dart';
import 'package:stackedprototype/data/models/purchase_order.dart';
import 'package:stackedprototype/data/models/supplier_purchase_delivery.dart';

class ExpandableListItem {
  String title;
  String date;
  List<ExpandableItem> expandableItems;

  ExpandableListItem(
      {this.title, this.date, this.expandableItems});

  ExpandableListItem.fromDelivery(PurchaseDelivery delivery) {
    title = 'PD # ${delivery.id}';
    date = delivery.createDate;
    if (delivery.deliveryItems != null) {
      expandableItems = List<ExpandableItem>();
      delivery.deliveryItems.forEach((item) {
        expandableItems.add(ExpandableItem(title: item.materialNameEn, quantity: '${item.quantity}'));
      });
    }
  }

  ExpandableListItem.fromSupplierDelivery(SupplierPurchaseDelivery delivery) {
    title = 'PD # ${delivery.id}';
    date = delivery.createDate;
    if (delivery.deliveryItems != null) {
      expandableItems = List<ExpandableItem>();
      delivery.deliveryItems.forEach((item) {
        expandableItems.add(ExpandableItem(title: item.materialNameEn, quantity: '${item.quantity}'));
      });
    }
  }

  ExpandableListItem.fromPurchaseOrder(PurchaseOrder purchaseOrder) {
    title = '${purchaseOrder.order.name}';
    date = purchaseOrder.order.dateOrder;
    if (purchaseOrder.order.orderItems != null) {
      expandableItems = List<ExpandableItem>();
      purchaseOrder.order.orderItems.forEach((item) {
        expandableItems.add(ExpandableItem(title: item.name, quantity: '${item.receivedQty}/${item.orderedQty}'));
      });
    }
  }

}
