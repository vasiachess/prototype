// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stackedprototype/data/models/delivery_item.dart';
import 'package:stackedprototype/data/models/order.dart';
import 'package:stackedprototype/ui/views/change_password/change_password_view.dart';
import 'package:stackedprototype/ui/views/edit_profile/edit_profile_view.dart';
import 'package:stackedprototype/ui/views/home/home_view.dart';
import 'package:stackedprototype/ui/views/more/more_view.dart';
import 'package:stackedprototype/ui/views/post_list/post_list_view.dart';
import 'package:stackedprototype/ui/views/purchase_delivery/purchase_delivery_view.dart';
import 'package:stackedprototype/ui/views/purchase_orders/purchase_orders_view.dart';
import 'package:stackedprototype/ui/views/purchase_orders_items/purchase_order_items_view.dart';
import 'package:stackedprototype/ui/views/scan/scan_view.dart';
import 'package:stackedprototype/ui/views/settings/settings_view.dart';
import 'package:stackedprototype/ui/views/settings_language/settings_language_view.dart';
import 'package:stackedprototype/ui/views/settings_save_mode/settings_save_mode_view.dart';
import 'package:stackedprototype/ui/views/success/success_view.dart';
import 'package:stackedprototype/ui/views/supplier_delivery/supplier_purchase_delivery_view.dart';
import 'package:stackedprototype/ui/views/supplier_scan/supplier_scan_view.dart';

abstract class Routes {
  static const homeViewRoute = '/';
  static const postListView = '/post-list-view';
  static const purchaseOrdersView = '/purchase-orders-view';
  static const purchaseOrderItemsView = '/purchase-order-items-view';
  static const purchaseDeliveryView = '/purchase-delivery-view';
  static const supplierPurchaseDeliveryView =
      '/supplier-purchase-delivery-view';
  static const scanView = '/scan-view';
  static const supplierScanView = '/supplier-scan-view';
  static const successView = '/success-view';
  static const moreView = '/more-view';
  static const editProfileView = '/edit-profile-view';
  static const changePasswordView = '/change-password-view';
  static const settingsView = '/settings-view';
  static const settingsLanguageView = '/settings-language-view';
  static const settingsSaveModeView = '/settings-save-mode-view';
  static const all = {
    homeViewRoute,
    postListView,
    purchaseOrdersView,
    purchaseOrderItemsView,
    purchaseDeliveryView,
    supplierPurchaseDeliveryView,
    scanView,
    supplierScanView,
    successView,
    moreView,
    editProfileView,
    changePasswordView,
    settingsView,
    settingsLanguageView,
    settingsSaveModeView,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeViewRoute:
        if (hasInvalidArgs<HomeViewArguments>(args)) {
          return misTypedArgsRoute<HomeViewArguments>(args);
        }
        final typedArgs = args as HomeViewArguments ?? HomeViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.postListView:
        if (hasInvalidArgs<PostListViewArguments>(args)) {
          return misTypedArgsRoute<PostListViewArguments>(args);
        }
        final typedArgs =
            args as PostListViewArguments ?? PostListViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => PostListView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.purchaseOrdersView:
        if (hasInvalidArgs<PurchaseOrdersViewArguments>(args)) {
          return misTypedArgsRoute<PurchaseOrdersViewArguments>(args);
        }
        final typedArgs = args as PurchaseOrdersViewArguments ??
            PurchaseOrdersViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => PurchaseOrdersView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.purchaseOrderItemsView:
        if (hasInvalidArgs<PurchaseOrderItemsViewArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<PurchaseOrderItemsViewArguments>(args);
        }
        final typedArgs = args as PurchaseOrderItemsViewArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => PurchaseOrderItemsView(order: typedArgs.order),
          settings: settings,
        );
      case Routes.purchaseDeliveryView:
        if (hasInvalidArgs<PurchaseDeliveryViewArguments>(args)) {
          return misTypedArgsRoute<PurchaseDeliveryViewArguments>(args);
        }
        final typedArgs = args as PurchaseDeliveryViewArguments ??
            PurchaseDeliveryViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => PurchaseDeliveryView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.supplierPurchaseDeliveryView:
        if (hasInvalidArgs<SupplierPurchaseDeliveryViewArguments>(args)) {
          return misTypedArgsRoute<SupplierPurchaseDeliveryViewArguments>(args);
        }
        final typedArgs = args as SupplierPurchaseDeliveryViewArguments ??
            SupplierPurchaseDeliveryViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              SupplierPurchaseDeliveryView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.scanView:
        if (hasInvalidArgs<ScanViewArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<ScanViewArguments>(args);
        }
        final typedArgs = args as ScanViewArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => ScanView(
              deliveryId: typedArgs.deliveryId,
              deliveryItem: typedArgs.deliveryItem),
          settings: settings,
        );
      case Routes.supplierScanView:
        if (hasInvalidArgs<SupplierScanViewArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<SupplierScanViewArguments>(args);
        }
        final typedArgs = args as SupplierScanViewArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => SupplierScanView(
              deliveryId: typedArgs.deliveryId,
              deliveryItem: typedArgs.deliveryItem),
          settings: settings,
        );
      case Routes.successView:
        if (hasInvalidArgs<SuccessViewArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<SuccessViewArguments>(args);
        }
        final typedArgs = args as SuccessViewArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => SuccessView(
              itemsCount: typedArgs.itemsCount,
              serialNotImported: typedArgs.serialNotImported),
          settings: settings,
        );
      case Routes.moreView:
        if (hasInvalidArgs<MoreViewArguments>(args)) {
          return misTypedArgsRoute<MoreViewArguments>(args);
        }
        final typedArgs = args as MoreViewArguments ?? MoreViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => MoreView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.editProfileView:
        if (hasInvalidArgs<EditProfileViewArguments>(args)) {
          return misTypedArgsRoute<EditProfileViewArguments>(args);
        }
        final typedArgs =
            args as EditProfileViewArguments ?? EditProfileViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => EditProfileView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.changePasswordView:
        if (hasInvalidArgs<ChangePasswordViewArguments>(args)) {
          return misTypedArgsRoute<ChangePasswordViewArguments>(args);
        }
        final typedArgs = args as ChangePasswordViewArguments ??
            ChangePasswordViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => ChangePasswordView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.settingsView:
        if (hasInvalidArgs<SettingsViewArguments>(args)) {
          return misTypedArgsRoute<SettingsViewArguments>(args);
        }
        final typedArgs =
            args as SettingsViewArguments ?? SettingsViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SettingsView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.settingsLanguageView:
        if (hasInvalidArgs<SettingsLanguageViewArguments>(args)) {
          return misTypedArgsRoute<SettingsLanguageViewArguments>(args);
        }
        final typedArgs = args as SettingsLanguageViewArguments ??
            SettingsLanguageViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SettingsLanguageView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.settingsSaveModeView:
        if (hasInvalidArgs<SettingsSaveModeViewArguments>(args)) {
          return misTypedArgsRoute<SettingsSaveModeViewArguments>(args);
        }
        final typedArgs = args as SettingsSaveModeViewArguments ??
            SettingsSaveModeViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SettingsSaveModeView(key: typedArgs.key),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//HomeView arguments holder class
class HomeViewArguments {
  final Key key;
  HomeViewArguments({this.key});
}

//PostListView arguments holder class
class PostListViewArguments {
  final Key key;
  PostListViewArguments({this.key});
}

//PurchaseOrdersView arguments holder class
class PurchaseOrdersViewArguments {
  final Key key;
  PurchaseOrdersViewArguments({this.key});
}

//PurchaseOrderItemsView arguments holder class
class PurchaseOrderItemsViewArguments {
  final Order order;
  PurchaseOrderItemsViewArguments({@required this.order});
}

//PurchaseDeliveryView arguments holder class
class PurchaseDeliveryViewArguments {
  final Key key;
  PurchaseDeliveryViewArguments({this.key});
}

//SupplierPurchaseDeliveryView arguments holder class
class SupplierPurchaseDeliveryViewArguments {
  final Key key;
  SupplierPurchaseDeliveryViewArguments({this.key});
}

//ScanView arguments holder class
class ScanViewArguments {
  final int deliveryId;
  final DeliveryItem deliveryItem;
  ScanViewArguments({@required this.deliveryId, @required this.deliveryItem});
}

//SupplierScanView arguments holder class
class SupplierScanViewArguments {
  final int deliveryId;
  final DeliveryItem deliveryItem;
  SupplierScanViewArguments(
      {@required this.deliveryId, @required this.deliveryItem});
}

//SuccessView arguments holder class
class SuccessViewArguments {
  final int itemsCount;
  final List<String> serialNotImported;
  SuccessViewArguments(
      {@required this.itemsCount, @required this.serialNotImported});
}

//MoreView arguments holder class
class MoreViewArguments {
  final Key key;
  MoreViewArguments({this.key});
}

//EditProfileView arguments holder class
class EditProfileViewArguments {
  final Key key;
  EditProfileViewArguments({this.key});
}

//ChangePasswordView arguments holder class
class ChangePasswordViewArguments {
  final Key key;
  ChangePasswordViewArguments({this.key});
}

//SettingsView arguments holder class
class SettingsViewArguments {
  final Key key;
  SettingsViewArguments({this.key});
}

//SettingsLanguageView arguments holder class
class SettingsLanguageViewArguments {
  final Key key;
  SettingsLanguageViewArguments({this.key});
}

//SettingsSaveModeView arguments holder class
class SettingsSaveModeViewArguments {
  final Key key;
  SettingsSaveModeViewArguments({this.key});
}
