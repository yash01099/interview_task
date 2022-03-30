import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/src/controller/post_controller.dart';
import 'package:interview_task/src/models/post_model.dart';
import 'package:interview_task/src/widgets/card_wrapper.dart';
import 'package:interview_task/src/widgets/loader.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    PostController.to.getPostList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        centerTitle: true,
      ),
      body: GetBuilder<PostController>(
          id: 'posts',
          builder: (_) {
            if (_.isLoading) {
              return Loader();
            } else {
              return ListView.builder(
                  itemCount: _.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    Post post = _.posts.elementAt(index);
                    return CardWrapper(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post.title ?? '',
                                  style: textTheme.headline6),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.01),
                                child: Text(
                                  post.body ?? '',
                                  style: textTheme.subtitle1,
                                ),
                              ),
                            ],
                          )),
                          IconButton(
                              onPressed: () => PostController.to
                                  .setFavourite(post.id!, index),
                              icon: post.isFavourite ?? false
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : Icon(Icons.favorite_border))
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
