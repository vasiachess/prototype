import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/app/router.gr.dart';
import 'package:stackedprototype/data/models/delivery_item.dart';
import 'package:stackedprototype/data/models/purchase_delivery.dart';
import 'package:stackedprototype/services/purchase_delivery_service.dart';


class PurchaseDeliveryViewModel extends FutureViewModel<List<PurchaseDelivery>> {

  final NavigationService _navigationService = locator<NavigationService>();
  final _purchaseDeliveryService = locator<PurchaseDeliveryService>();

  @override
  Future<List<PurchaseDelivery>> futureToRun() => _purchaseDeliveryService.getPurchaseDelivery(3);

  Future navigateToScanView(int deliveryId, DeliveryItem deliveryItem) async {
    await _navigationService.navigateTo(Routes.scanView, arguments: ScanViewArguments(deliveryId: deliveryId, deliveryItem: deliveryItem),);
  }

}
