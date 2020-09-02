// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/api.dart';
import '../services/posts_service.dart';
import '../services/purchase_delivery_service.dart';
import '../services/purchase_order_items_service.dart';
import '../services/purchase_orders_service.dart';
import '../services/qr_code_service.dart';
import '../services/third_party_services_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<Api>(() => Api());
  gh.lazySingleton<DialogService>(() => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<PostsService>(() => PostsService());
  gh.lazySingleton<PurchaseDeliveryService>(() => PurchaseDeliveryService());
  gh.lazySingleton<PurchaseOrderItemsService>(
      () => PurchaseOrderItemsService());
  gh.lazySingleton<PurchaseOrdersService>(() => PurchaseOrdersService());
  gh.lazySingleton<QrCodeService>(() => QrCodeService());
  gh.lazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackbarService);
  return get;
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}
