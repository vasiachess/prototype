import 'package:stackedprototype/data/models/delivery_item.dart';
import 'package:stackedprototype/data/models/expandable_list_item.dart';

class PurchaseDelivery {
  int id;
  String createDate;
  String scheduledDate;
  List<DeliveryItem> deliveryItems;

  PurchaseDelivery(
      {this.id, this.createDate, this.scheduledDate, this.deliveryItems});

  PurchaseDelivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createDate = json['create_date'];
    scheduledDate = json['scheduled_date'];
    if (json['delivery_items'] != null) {
      deliveryItems = new List<DeliveryItem>();
      json['delivery_items'].forEach((v) {
        deliveryItems.add(new DeliveryItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['create_date'] = this.createDate;
    data['scheduled_date'] = this.scheduledDate;
    if (this.deliveryItems != null) {
      data['delivery_items'] =
          this.deliveryItems.map((v) => v.toJson()).toList();
    }
    return data;
  }

  ExpandableListItem toExpandableListItem() => ExpandableListItem(
    title: 'PD # ${this.id}',
    date: this.createDate,
    expandableItems: []

  );


}
