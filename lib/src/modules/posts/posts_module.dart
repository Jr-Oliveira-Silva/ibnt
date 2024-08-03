import 'package:app_ibnt/src/modules/posts/posts_imports.dart';

class PostsModule extends Module {
  @override
  List<Module> get imports => [
        HomeModule(),
      ];
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const PostsPage());
    r.child('/post', child: (_) => const PostPage());
    r.child('/add_post', child: (_) => const AddPostsPage());
  }
}
