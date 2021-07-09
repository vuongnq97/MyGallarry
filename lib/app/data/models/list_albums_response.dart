import 'package:json_annotation/json_annotation.dart';

//
import 'package:my_gallarry/app/data/models/album.dart';

part 'list_albums_response.g.dart';

@JsonSerializable()
class ListAlbumsResponse {
  List<Album>? albums;
  String? nextPageToken;

  ListAlbumsResponse(this.albums, this.nextPageToken);

  factory ListAlbumsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAlbumsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListAlbumsResponseToJson(this);
}
