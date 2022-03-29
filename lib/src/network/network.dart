import 'package:dio/dio.dart';
import 'package:interview_task/src/models/album_model.dart';
import 'package:interview_task/src/models/photos_model.dart';
import 'package:interview_task/src/models/post_model.dart';

class Network {
  static Dio _dio = new Dio();

  static const BASE_URL = 'https://jsonplaceholder.typicode.com/';

  static Future getPosts() async {
    try {
      Response response = await _dio.get(BASE_URL + 'posts');
      Post post = new Post();
      return post.postsFromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  static Future getAlbums() async {
    try {
      Response response = await _dio.get(BASE_URL + 'albums');
      Album album = new Album();
      return album.albumsFromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  static Future getPhotos() async {
    try {
      Response response = await _dio.get(BASE_URL + 'photos');
      Photo photo = new Photo();
      return photo.photosFromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}
