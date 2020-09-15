import 'package:auto_route/auto_route_annotations.dart';
import 'package:stackedprototype/ui/views/change_password/change_password_view.dart';
import 'package:stackedprototype/ui/views/chat/chat_view.dart';
import 'package:stackedprototype/ui/views/edit_profile/edit_profile_view.dart';
import 'package:stackedprototype/ui/views/home/home_view.dart';
import 'package:stackedprototype/ui/views/image_footer/image_footer_view.dart';
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

@MaterialAutoRouter()
class $Router {
  @initial
  HomeView homeViewRoute;
  PostListView postListView;
  PurchaseOrdersView purchaseOrdersView;
  PurchaseOrderItemsView purchaseOrderItemsView;
  PurchaseDeliveryView purchaseDeliveryView;
  SupplierPurchaseDeliveryView supplierPurchaseDeliveryView;
  ScanView scanView;
  SupplierScanView supplierScanView;
  SuccessView successView;
  MoreView moreView;
  EditProfileView editProfileView;
  ChangePasswordView changePasswordView;
  SettingsView settingsView;
  SettingsLanguageView settingsLanguageView;
  SettingsSaveModeView settingsSaveModeView;
  ImageFooterView imageFooterView;
  ChatView chatView;
}
