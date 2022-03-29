class Album {
  int? userId;
  int? id;
  String? title;

  Album({
    this.userId,
    this.id,
    this.title,
  });

  List<Album> albumsFromJson(dynamic data) =>
      List<Album>.from(data.map((x) => Album.fromJson(x)));

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );
}
