import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/app/router.gr.dart';
import 'package:stackedprototype/data/models/order.dart';
import 'package:stackedprototype/data/models/purchase_order.dart';
import 'package:stackedprototype/services/purchase_orders_service.dart';

class PurchaseOrdersViewModel extends FutureViewModel<List<PurchaseOrder>> {

  final NavigationService _navigationService = locator<NavigationService>();
  final _purchaseOrdersService = locator<PurchaseOrdersService>();

  @override
  Future<List<PurchaseOrder>> futureToRun() => _purchaseOrdersService.getPurchaseOrders();

  Future navigateToPurchaseOrderItems(Order order) async {
    await _navigationService.navigateTo(Routes.purchaseOrderItemsView, arguments: PurchaseOrderItemsViewArguments(order: order),);
  }

}
