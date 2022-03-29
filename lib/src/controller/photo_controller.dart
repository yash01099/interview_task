import 'package:get/get.dart';
import 'package:interview_task/src/models/photos_model.dart';
import 'package:interview_task/src/network/network.dart';

class PhotoController extends GetxController {
  static PhotoController get to => Get.find();

  List<Photo> photos = [];
  bool isLoading = true;

  void getPhotoList() async {
    Network.getPhotos().then((postList) {
      photos.addAll(postList);
      isLoading = false;
      update(['photos']);
    });
  }
}
