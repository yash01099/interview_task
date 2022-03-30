import 'package:get/get.dart';
import 'package:interview_task/src/models/post_model.dart';
import 'package:interview_task/src/network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostController extends GetxController {
  static PostController get to => Get.find();

  List<Post> posts = [];
  bool isLoading = true;

  void getPostList() async {
    Network.getPosts().then((postList) async {
      final prefs = await SharedPreferences.getInstance();
      final List<String> items = prefs.getStringList('favourites') ?? [];

      for (var item in postList) {
        if (items.contains(item.id.toString())) {
          item.isFavourite = true;
        }
      }

      posts.addAll(postList);

      isLoading = false;
      update(['posts', 'fav_posts']);
    });
  }

  void setFavourite(int postId, int index) async {
    bool isFavourited = posts[index].isFavourite ?? false;

    final prefs = await SharedPreferences.getInstance();
    final List<String> items = prefs.getStringList('favourites') ?? [];

    if (isFavourited) {
      items.removeWhere((element) => element == postId.toString());
      await prefs.setStringList('favourites', items);
      posts[index].isFavourite = false;
      update(['posts', 'fav_posts']);
    } else {
      items.add(postId.toString());
      await prefs.setStringList('favourites', items);
      posts[index].isFavourite = true;
      update(['posts', 'fav_posts']);
    }
  }
}
