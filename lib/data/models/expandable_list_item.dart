import 'package:stackedprototype/data/models/expandable_item.dart';
import 'package:stackedprototype/data/models/purchase_delivery.dart';

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

}
