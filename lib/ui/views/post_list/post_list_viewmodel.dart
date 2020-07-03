import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/data/models/post.dart';

class PostListViewModel extends FutureViewModel<List<Post>> {

  var url = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<List<Post>> futureToRun() async {
    await getPosts();
    return posts;
  }

  List<Post> _posts = List<Post>();
  List<Post> get posts => _posts;

  Future<void> getPosts() async {

    var response = await http.get(url);
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var post in parsed) {
      _posts.add(Post.fromJson(post));
    }

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    notifyListeners();

  }

}
