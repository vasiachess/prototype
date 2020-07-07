import 'package:stacked/stacked.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/data/models/purchase_order_item.dart';
import 'package:stackedprototype/services/purchase_order_items_service.dart';

class PurchaseOrderItemsViewModel extends FutureViewModel<List<PurchaseOrderItem>> {

  final _purchaseOrderItemsService = locator<PurchaseOrderItemsService>();

  @override
  Future<List<PurchaseOrderItem>> futureToRun() => _purchaseOrderItemsService.getPurchaseOrderItems();

}
