import 'package:auto_route/auto_route_annotations.dart';
import 'package:stackedprototype/ui/views/home/home_view.dart';
import 'package:stackedprototype/ui/views/post_list/post_list_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomeView homeViewRoute;
  PostListView postListView;
}
