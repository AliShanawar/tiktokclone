import 'package:tiktokclone/model/user.dart';

class Video {
  final String videoUrl;
  final String SearchQuery;
  final String caption;

  final String Likes;
  final String Share;
  final String Phonenumber;

  Video(this.videoUrl, this.caption, this.Likes, this.Share, this.SearchQuery,
      this.Phonenumber);
}
