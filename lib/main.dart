import 'package:flutter/material.dart';
import 'package:stackedprototype/ui/views/home/home_view.dart';
import 'package:stackedprototype/ui/views/post_list/post_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prototype Stacked with Qr code scanner',
//      home: HomeView(),
      initialRoute: HomeView.id,
      routes: {
        HomeView.id: (context) => HomeView(),
        PostListView.id: (context) => PostListView(),
      },
    );
  }
}