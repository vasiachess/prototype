import 'package:stacked/stacked.dart';
import 'package:stackedprototype/app/locator.dart';
import 'package:stackedprototype/data/models/post.dart';
import 'package:stackedprototype/services/posts_service.dart';

class PostListViewModel extends FutureViewModel<List<Post>> {

  final _postsService = locator<PostsService>();

  @override
  Future<List<Post>> futureToRun() => _postsService.getPosts();

}
