import 'package:stackedprototype/data/models/delivery_item.dart';

class ReceiveDeliveryItemsRequestModel {
  Params params;

  ReceiveDeliveryItemsRequestModel({this.params});

  ReceiveDeliveryItemsRequestModel.fromJson(Map<String, dynamic> json) {
    params =
    json['params'] != null ? new Params.fromJson(json['params']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.params != null) {
      data['params'] = this.params.toJson();
    }
    return data;
  }
}

class Params {
  List<Pickings> pickings;

  Params({this.pickings});

  Params.fromJson(Map<String, dynamic> json) {
    if (json['pickings'] != null) {
      pickings = new List<Pickings>();
      json['pickings'].forEach((v) {
        pickings.add(new Pickings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pickings != null) {
      data['pickings'] = this.pickings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pickings {
  int id;
  List<DeliveryItem> delivryItems;

  Pickings({this.id, this.delivryItems});

  Pickings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['delivry_items'] != null) {
      delivryItems = new List<DeliveryItem>();
      json['delivry_items'].forEach((v) {
        delivryItems.add(new DeliveryItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.delivryItems != null) {
      data['delivry_items'] = this.delivryItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

