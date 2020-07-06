import 'package:stackedprototype/data/models/material_Item.dart';

class PurchaseOrderItem {

  String id;
  MaterialItem materialItem;
  int quantityOrdered;
  int quantityReceived;

  PurchaseOrderItem({this.id, this.materialItem, this.quantityOrdered, this.quantityReceived,});

  PurchaseOrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    materialItem = MaterialItem.fromJson(json['materialItem']);
    quantityOrdered = json['quantityOrdered'];
    quantityReceived = json['quantityReceived'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['materialItem'] = this.materialItem.toJson();
    data['quantityOrdered'] = this.quantityOrdered;
    data['quantityReceived'] = this.quantityReceived;
    return data;
  }
}