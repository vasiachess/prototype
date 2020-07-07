class PurchaseOrder {

  String id;
  String supplier;
  String orderDate;

  PurchaseOrder({this.id, this.supplier, this.orderDate});

  PurchaseOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supplier = json['supplier'];
    orderDate = json['orderDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['supplier'] = this.supplier;
    data['orderDate'] = this.orderDate;
    return data;
  }
}