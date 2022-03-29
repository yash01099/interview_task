import 'package:get/get.dart';
import 'package:interview_task/src/models/album_model.dart';
import 'package:interview_task/src/network/network.dart';

class AlbumController extends GetxController {
  static AlbumController get to => Get.find();

  List<Album> albums = [];
  bool isLoading = true;

  void getAlbumList() async {
    Network.getAlbums().then((postList) {
      albums.addAll(postList);
      isLoading = false;
      update(['albums']);
    });
  }
}
