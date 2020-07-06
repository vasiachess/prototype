class PurchaseOrder {

  String id;
  String supplier;
  String date;

  PurchaseOrder({this.id, this.supplier, this.date});

  PurchaseOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supplier = json['supplier'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['supplier'] = this.supplier;
    data['date'] = this.date;
    return data;
  }
}