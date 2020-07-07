import 'package:auto_route/auto_route_annotations.dart';
import 'package:stackedprototype/ui/views/home/home_view.dart';
import 'package:stackedprototype/ui/views/post_list/post_list_view.dart';
import 'package:stackedprototype/ui/views/purchase_orders/purchase_orders_view.dart';
import 'package:stackedprototype/ui/views/purchase_orders_items/purchase_order_items_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomeView homeViewRoute;
  PostListView postListView;
  PurchaseOrdersView purchaseOrdersView;
  PurchaseOrderItemsView purchaseOrderItemsView;
}
