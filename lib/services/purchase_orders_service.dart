import 'package:injectable/injectable.dart';
import 'package:stackedprototype/data/models/purchase_order.dart';

@lazySingleton
class PurchaseOrdersService {

  List<PurchaseOrder> _purchaseOrders;
  List<PurchaseOrder> get purchaseOrders => _purchaseOrders;

  Future<List<PurchaseOrder>> getPurchaseOrders() async {

//    _purchaseOrders = List<PurchaseOrder>();

    _purchaseOrders = [
      new PurchaseOrder(id: 'po01', supplier: 'Supplier-1', orderDate: '2020-07-05'),
      new PurchaseOrder(id: 'po02', supplier: 'Supplier-2', orderDate: '2020-07-06'),
      new PurchaseOrder(id: 'po03', supplier: 'Supplier-3', orderDate: '2020-07-07'),
      new PurchaseOrder(id: 'po04', supplier: 'Supplier-1', orderDate: '2020-07-07'),
    ];

    return _purchaseOrders;

  }
}
