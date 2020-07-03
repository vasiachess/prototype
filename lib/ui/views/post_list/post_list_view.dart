import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'post_list_viewmodel.dart';

class PostListView extends StatelessWidget {
  const PostListView({Key key}) : super(key: key);
  static const String id = 'posts_screen';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostListViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: model.posts.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) => ListTile(
                      title: Text(model.posts[index].title),
                      subtitle: Text(model.posts[index].body),
                    )),
      ),
      viewModelBuilder: () => PostListViewModel(),
    );
  }
}
