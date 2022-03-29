import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageDialog extends StatelessWidget {
  final url;
  ImageDialog(this.url);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.width * 0.6,
        child: PhotoView(imageProvider: CachedNetworkImageProvider(url)),
      ),
    );
  }
}
