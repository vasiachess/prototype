import 'package:stackedprototype/data/models/purchase_delivery.dart';

class GetPurchaseDeliveryResponse {
  String jsonrpc;
  Null id;
  Result result;

  GetPurchaseDeliveryResponse({this.jsonrpc, this.id, this.result});

  GetPurchaseDeliveryResponse.fromJson(Map<String, dynamic> json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jsonrpc'] = this.jsonrpc;
    data['id'] = this.id;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  String status;
  int orderId;
  List<PurchaseDelivery> purchaseDelivery;

  Result({this.status, this.orderId, this.purchaseDelivery});

  Result.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    orderId = json['order_id'];
    if (json['purchase_delivery'] != null) {
      purchaseDelivery = new List<PurchaseDelivery>();
      json['purchase_delivery'].forEach((v) {
        purchaseDelivery.add(new PurchaseDelivery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['order_id'] = this.orderId;
    if (this.purchaseDelivery != null) {
      data['purchase_delivery'] =
          this.purchaseDelivery.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

