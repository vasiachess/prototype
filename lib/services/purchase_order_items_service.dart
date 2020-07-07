import 'package:injectable/injectable.dart';
import 'package:stackedprototype/data/models/material_Item.dart';
import 'package:stackedprototype/data/models/purchase_order_item.dart';

@lazySingleton
class PurchaseOrderItemsService {

  List<PurchaseOrderItem> _purchaseOrderItems;
  List<PurchaseOrderItem> get purchaseOrderItems => _purchaseOrderItems;

  Future<List<PurchaseOrderItem>> getPurchaseOrderItems() async {

//    _purchaseOrderItems = List<PurchaseOrderItem>();

    _purchaseOrderItems = [
      new PurchaseOrderItem(id: 'poi01', materialItem: MaterialItem(id: 'mi01', nameEn: 'material01', unitOfMeasure: 'kg'), quantityOrdered: 5, quantityReceived: 3),
      new PurchaseOrderItem(id: 'poi02', materialItem: MaterialItem(id: 'mi02', nameEn: 'material02', unitOfMeasure: 'l'), quantityOrdered: 10, quantityReceived: 5),
      new PurchaseOrderItem(id: 'poi03', materialItem: MaterialItem(id: 'mi03', nameEn: 'material03', unitOfMeasure: 'm'), quantityOrdered: 3, quantityReceived: 0),
    ];

    return _purchaseOrderItems;

  }
}
