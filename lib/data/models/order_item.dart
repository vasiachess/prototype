class OrderItem {
  int id;
  String name;
  double orderedQty;
  double receivedQty;

  OrderItem({this.id, this.name, this.orderedQty, this.receivedQty});

  OrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    orderedQty = json['ordered_qty'];
    receivedQty = json['recieved_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ordered_qty'] = this.orderedQty;
    data['recieved_qty'] = this.receivedQty;
    return data;
  }
}