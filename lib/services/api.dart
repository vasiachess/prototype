import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:stackedprototype/data/models/auth_response.dart';
import 'package:stackedprototype/data/models/get_material_item_response.dart';
import 'package:stackedprototype/data/models/get_purchase_delivery_response.dart';
import 'package:stackedprototype/data/models/get_purchase_orders_response_model.dart';
import 'package:stackedprototype/data/models/material.dart';
import 'package:stackedprototype/data/models/purchase_delivery.dart';
import 'package:stackedprototype/data/models/purchase_order.dart';
import 'package:stackedprototype/data/models/receive_delivery_items_request_model.dart';
import 'package:stackedprototype/data/models/receiving_delivery_response.dart';

@lazySingleton
class Api {
  static const baseUrl = 'http://tahakomapps.ntww.com:8069';
  static const headerKey = 'X-Openerp-Session-Id';

  var client = new http.Client();

  Future<String> postAuthenticate() async {

    String sessionId = '';
    Map<String, dynamic> map = {
      'params': {'login': 'admin', 'password': 'admin@123', 'db': 'Tahakom_POC_API'},
    };
    var body = json.encode(map);

    var response = await client.post('$baseUrl/web/session/authenticate', headers: {'Content-Type': 'application/json'}, body: body);

    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);
      final auth = AuthResponse.fromJson(parsed);
      sessionId = auth.result.sessionId;
      print('Response Authenticate status: ${response.statusCode}');
      print('Session Id: ${auth.result.sessionId}');
    } else {
      print('Request failed with status: ${response.statusCode}, ${response.body},.');
    }

    return sessionId;
  }

  Future<List<PurchaseOrder>> getPurchaseOrderList(String sessionId) async {

    var purchaseOrders = List<PurchaseOrder>();
    String jsonBody = '{"params":{}}';
    var response = await client.post('$baseUrl/purchase/orders/', headers: {'Content-Type': 'application/json', '$headerKey': '$sessionId'}, body: jsonBody);

    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);
      GetPurchaseOrderListResponse orderListResponse = GetPurchaseOrderListResponse.fromJson(parsed);
      purchaseOrders = orderListResponse.result.purchaseOrders;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return purchaseOrders;
  }

  Future<Material> getMaterialItem(String sessionId, int itemId) async {

    var response = await client.get('$baseUrl/material/$itemId', headers: {'$headerKey': sessionId});

    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);
      GetMaterialItemResponse materialResponse= GetMaterialItemResponse.fromJson(parsed);
      return materialResponse.result.material;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return null;
  }

  Future<List<PurchaseDelivery>> getPurchaseDelivery(String sessionId, int orderId) async {

    String jsonBody = '{"params":{}}';

    var response = await client.post('$baseUrl/purchase/$orderId/pickings/', headers: {'Content-Type': 'application/json', '$headerKey': sessionId}, body: jsonBody);

    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);
      GetPurchaseDeliveryResponse deliveryResponse= GetPurchaseDeliveryResponse.fromJson(parsed);
      return deliveryResponse.result.purchaseDelivery;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return null;

  }

  Future<ReceivingDeliveryResponse> receiveDeliveryItems(String sessionId, ReceiveDeliveryItemsRequestModel requestModel) async {

    Map<String, dynamic> map = {
      'params': {'pickings': '[{"id": 21, "delivry_items": [{"id": 23,"material_id": 986,"material_qty": 5,"scanned_serial_numbers": ["CUL1", "CUL2" ,"CUL3", "CUL4", "CUL5"]}]}]'},
    };

    var body = json.encode(requestModel.toJson());

    var response = await client.post('$baseUrl/purchase/receive/pickings/', headers: {'Content-Type': 'application/json', '$headerKey': sessionId}, body: body);

    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);
      ReceivingDeliveryResponse deliveryResponse = ReceivingDeliveryResponse.fromJson(parsed);
      return deliveryResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return null;

  }

  Future<String> createPurchaseDelivery(String sessionId, int orderId) async {

    Map map = {
      'params': {'order_id': '$orderId'},
    };
    var body = json.encode(map);

    var response = await client.post('$baseUrl/purchase/delivery/create/', headers: {'$headerKey': sessionId}, body: body);

    if (response.statusCode == 200) {
      return 'success';
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return null;
  }

}
