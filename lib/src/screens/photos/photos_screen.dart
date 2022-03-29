import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/src/controller/photo_controller.dart';
import 'package:interview_task/src/models/photos_model.dart';
import 'package:interview_task/src/widgets/card_wrapper.dart';
import 'package:interview_task/src/widgets/image_dailog.dart';
import 'package:interview_task/src/widgets/loader.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  @override
  void initState() {
    PhotoController.to.getPhotoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
        centerTitle: true,
      ),
      body: GetBuilder<PhotoController>(
          id: 'photos',
          builder: (_) {
            if (_.isLoading) {
              return Loader();
            } else {
              return ListView.builder(
                  itemCount: _.photos.length,
                  itemBuilder: (BuildContext context, int index) {
                    Photo photo = _.photos.elementAt(index);
                    return CardWrapper(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await showDialog(
                                  context: context,
                                  builder: (_) => ImageDialog(photo.url));
                            },
                            child: CachedNetworkImage(
                              imageUrl: photo.thumbnailUrl ?? '',
                            ),
                          ),
                          Flexible(
                              child: Container(
                            padding: EdgeInsets.only(left: size.width * 0.03),
                            child: Text(photo.title ?? '',
                                style: textTheme.headline6),
                          ))
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
