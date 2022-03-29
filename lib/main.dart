import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/src/app.dart';
import 'package:interview_task/src/controller/album_controller.dart';
import 'package:interview_task/src/controller/photo_controller.dart';
import 'package:interview_task/src/controller/post_controller.dart';

void main() {
  Get.put(PostController());
  Get.put(AlbumController());
  Get.put(PhotoController());
  runApp(const InterviewTask());
}
