class Photo {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photo({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  List<Photo> photosFromJson(dynamic data) =>
      List<Photo>.from(data.map((x) => Photo.fromJson(x)));

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );
}
