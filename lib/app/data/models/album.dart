import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  String? id;
  String? title;
  String? productUrl;
  bool? isWriteable;
  String? mediaItemsCount;
  String? coverPhotoBaseUrl;
  String? coverPhotoMediaItemId;

  Album(
      {this.id,
      this.title,
      this.productUrl,
      this.isWriteable,
      this.mediaItemsCount,
      this.coverPhotoBaseUrl,
      this.coverPhotoMediaItemId});

  Album.toCreate(this.title);

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Album && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
