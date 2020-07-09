import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/data/models/purchase_order.dart';
import 'package:stackedprototype/services/api.dart';

@lazySingleton
class PurchaseOrdersService {

  final _api = locator<Api>();

  List<PurchaseOrder> _purchaseOrders;
  List<PurchaseOrder> get purchaseOrders => _purchaseOrders;

  Future<List<PurchaseOrder>> getPurchaseOrders() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final sessionId = prefs.getString('sessionId');
    _purchaseOrders = await _api.getPurchaseOrderList(sessionId);

    return _purchaseOrders;

  }
}
