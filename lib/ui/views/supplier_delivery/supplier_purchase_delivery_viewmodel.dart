import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/app/router.gr.dart';
import 'package:stackedprototype/data/models/delivery_item.dart';
import 'package:stackedprototype/data/models/supplier_purchase_delivery.dart';
import 'package:stackedprototype/services/purchase_delivery_service.dart';


class SupplierPurchaseDeliveryViewModel extends FutureViewModel<List<SupplierPurchaseDelivery>> {

  final NavigationService _navigationService = locator<NavigationService>();
  final _purchaseDeliveryService = locator<PurchaseDeliveryService>();

  @override
  Future<List<SupplierPurchaseDelivery>> futureToRun() => _purchaseDeliveryService.getPendingSupplierPurchaseDelivery();

  Future navigateToScanView(int deliveryId, DeliveryItem deliveryItem) async {
    await _navigationService.navigateTo(Routes.supplierScanView, arguments: SupplierScanViewArguments(deliveryId: deliveryId, deliveryItem: deliveryItem),);
  }

}
