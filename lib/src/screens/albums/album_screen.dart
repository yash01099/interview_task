import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/src/controller/album_controller.dart';
import 'package:interview_task/src/models/album_model.dart';
import 'package:interview_task/src/widgets/card_wrapper.dart';
import 'package:interview_task/src/widgets/loader.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  void initState() {
    AlbumController.to.getAlbumList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
        centerTitle: true,
      ),
      body: GetBuilder<AlbumController>(
          id: 'albums',
          builder: (_) {
            if (_.isLoading) {
              return Loader();
            } else {
              return ListView.builder(
                  itemCount: _.albums.length,
                  itemBuilder: (BuildContext context, int index) {
                    Album album = _.albums.elementAt(index);
                    return CardWrapper(
                      child:
                          Text(album.title ?? '', style: textTheme.headline6),
                    );
                  });
            }
          }),
    );
  }
}
