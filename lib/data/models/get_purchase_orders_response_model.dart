import 'package:stackedprototype/data/models/purchase_order.dart';

class GetPurchaseOrderListResponse {
  String jsonrpc;
  Null id;
  Result result;

  GetPurchaseOrderListResponse({this.jsonrpc, this.id, this.result});

  GetPurchaseOrderListResponse.fromJson(Map<String, dynamic> json) {
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
  List<PurchaseOrder> purchaseOrders;

  Result({this.status, this.purchaseOrders});

  Result.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['purchase_order'] != null) {
      purchaseOrders = new List<PurchaseOrder>();
      json['purchase_order'].forEach((v) {
        purchaseOrders.add(new PurchaseOrder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.purchaseOrders != null) {
      data['purchase_order'] =
          this.purchaseOrders.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

