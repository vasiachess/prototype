class PurchaseDelivery  {

  String id;
  String date;

  PurchaseDelivery ({this.id, this.date});

  PurchaseDelivery .fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    return data;
  }
}