
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
  List<DeliveryItem> deliveryItems;

  Pickings({this.id, this.deliveryItems});

  Pickings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    if (this.deliveryItems != null) {
      data['delivery_items'] = this.deliveryItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryItem {
  int id;
  int materialId;
  int materialQty;
  List<String> scannedSerialNumbers;

  DeliveryItem(
      {this.id, this.materialId, this.materialQty, this.scannedSerialNumbers});

  DeliveryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    materialId = json['material_id'];
    materialQty = json['material_qty'];
    scannedSerialNumbers = json['scanned_serial_numbers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['material_id'] = this.materialId;
    data['material_qty'] = this.materialQty;
    data['scanned_serial_numbers'] = this.scannedSerialNumbers;
    return data;
  }
}

