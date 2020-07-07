// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedprototype/services/posts_service.dart';
import 'package:stackedprototype/services/purchase_order_items_service.dart';
import 'package:stackedprototype/services/purchase_orders_service.dart';
import 'package:stackedprototype/services/qr_code_service.dart';
import 'package:stackedprototype/services/third_party_services_module.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerLazySingleton<PostsService>(() => PostsService());
  g.registerLazySingleton<PurchaseOrderItemsService>(
      () => PurchaseOrderItemsService());
  g.registerLazySingleton<PurchaseOrdersService>(() => PurchaseOrdersService());
  g.registerLazySingleton<QrCodeService>(() => QrCodeService());
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
}
