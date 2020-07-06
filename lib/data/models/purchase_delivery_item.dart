import 'package:stackedprototype/data/models/material_Item.dart';
import 'package:stackedprototype/data/models/purchase_delivery.dart';
import 'package:stackedprototype/data/models/purchase_order_item.dart';

class PurchaseDeliveryItem {

  String id;
  MaterialItem materialItem;
  PurchaseDelivery purchaseDelivery;
  PurchaseOrderItem purchaseOrderItem;
  int quantity;
  int serialNumber;
  String warehouse;

  PurchaseDeliveryItem ({this.id, this.materialItem, this.purchaseDelivery, this.purchaseOrderItem, this.quantity, this.serialNumber, this.warehouse,});

  PurchaseDeliveryItem .fromJson(Map<String, dynamic> json) {
    id = json['id'];
    materialItem = MaterialItem.fromJson(json['materialItem']);
    purchaseDelivery = PurchaseDelivery.fromJson(json['purchaseDelivery']);
    purchaseOrderItem = PurchaseOrderItem.fromJson(json['purchaseOrderItem']);
    quantity = json['quantity'];
    serialNumber = json['serialNumber'];
    warehouse = json['warehouse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['materialItem'] = this.materialItem.toJson();
    data['purchaseDelivery'] = this.purchaseDelivery.toJson();
    data['purchaseOrderItem'] = this.purchaseOrderItem.toJson();
    data['quantity'] = this.quantity;
    data['serialNumber'] = this.serialNumber;
    data['warehouse'] = this.warehouse;
    return data;
  }
}