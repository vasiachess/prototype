import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:stackedprototype/data/models/post.dart';

@lazySingleton
class PostsService {
  var url = 'https://jsonplaceholder.typicode.com/posts';

  List<Post> _posts;
  List<Post> get posts => _posts;

  bool get hasPosts => _posts != null && _posts.isNotEmpty;

  Future<List<Post>> getPosts() async {

    _posts = List<Post>();
    var response = await http.get(url);
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var post in parsed) {
      _posts.add(Post.fromJson(post));
    }
    print('Response status: ${response.statusCode}');

    return _posts;

  }
}
