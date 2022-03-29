class Post {
  int? userId;
  int? id;
  String? title;
  String? body;
  bool? isFavourite;

  Post({this.userId, this.id, this.title, this.body, this.isFavourite});

  List<Post> postsFromJson(dynamic data) =>
      List<Post>.from(data.map((x) => Post.fromJson(x)));

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
      isFavourite: false);
}
