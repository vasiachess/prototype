import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/data/models/purchase_delivery.dart';
import 'package:stackedprototype/data/models/supplier_purchase_delivery.dart';
import 'package:stackedprototype/services/api.dart';

@lazySingleton
class PurchaseDeliveryService {

  final _api = locator<Api>();

  List<PurchaseDelivery> _purchaseDelivery;
  List<PurchaseDelivery> get purchaseDelivery => _purchaseDelivery;

  List<SupplierPurchaseDelivery> _purchaseSupplierDelivery;
  List<SupplierPurchaseDelivery> get purchaseSupplierDelivery => _purchaseSupplierDelivery;

  Future<List<PurchaseDelivery>> getPurchaseDelivery(int orderId) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final sessionId = prefs.getString('sessionId');
    _purchaseDelivery = await _api.getPurchaseDelivery(sessionId, orderId) ?? [];

    return _purchaseDelivery;

  }

  Future<List<SupplierPurchaseDelivery>> getSupplierPurchaseDelivery(int orderId) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final sessionId = prefs.getString('sessionId');
    _purchaseSupplierDelivery = await _api.getSupplierPurchaseDelivery(sessionId, orderId) ?? [];

    return _purchaseSupplierDelivery;

  }
}
