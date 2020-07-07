import 'package:stackedprototype/data/models/material_Item.dart';
import 'package:stackedprototype/data/models/purchase_order.dart';

class PurchaseOrderItem {

  String id;
  PurchaseOrder purchaseOrder;
  MaterialItem materialItem;
  int quantityOrdered;
  int quantityReceived;

  PurchaseOrderItem({this.id, this.purchaseOrder, this.materialItem, this.quantityOrdered, this.quantityReceived,});

  PurchaseOrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    purchaseOrder = PurchaseOrder.fromJson(json['purchaseOrder']);
    materialItem = MaterialItem.fromJson(json['materialItem']);
    quantityOrdered = json['quantityOrdered'];
    quantityReceived = json['quantityReceived'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['purchaseOrder'] = this.purchaseOrder.toJson();
    data['materialItem'] = this.materialItem.toJson();
    data['quantityOrdered'] = this.quantityOrdered;
    data['quantityReceived'] = this.quantityReceived;
    return data;
  }
}