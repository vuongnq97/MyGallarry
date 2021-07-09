import 'package:json_annotation/json_annotation.dart';
import 'package:my_gallarry/app/data/models/album.dart';

part 'create_album_request.g.dart';

@JsonSerializable()
class CreateAlbumRequest {
  Album? album;

  CreateAlbumRequest(this.album);

  CreateAlbumRequest.fromTitle(String title) {
    album = Album.toCreate(title);
  }

  factory CreateAlbumRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAlbumRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAlbumRequestToJson(this);
}
