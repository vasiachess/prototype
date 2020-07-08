import 'package:stackedprototype/data/models/order_item.dart';

class Order {
  int id;
  String name;
  String dateOrder;
  String supplier;
  List<OrderItem> orderItems;

  Order({this.id, this.name, this.dateOrder, this.supplier, this.orderItems});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dateOrder = json['date_order'];
    supplier = json['supplier'];
    if (json['order_items'] != null) {
      orderItems = new List<OrderItem>();
      json['order_items'].forEach((v) {
        orderItems.add(new OrderItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date_order'] = this.dateOrder;
    data['supplier'] = this.supplier;
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}