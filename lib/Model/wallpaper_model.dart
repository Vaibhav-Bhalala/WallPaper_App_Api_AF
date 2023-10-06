class WallPaperModel {
  String largeImageURL;
  var downloads;
  var user;
  var likes;

  WallPaperModel(
      {required this.downloads,
      required this.largeImageURL,
      required this.likes,
      required this.user});

  factory WallPaperModel.fromJson({required Map data}) {
    return WallPaperModel(
        downloads: data['downloads'],
        largeImageURL: data['largeImageURL'],
        likes: data['likes'],
        user: data['user']);
  }
}
