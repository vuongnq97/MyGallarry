import 'package:json_annotation/json_annotation.dart';

part 'batch_create_media_items_request.g.dart';

@JsonSerializable()
class BatchCreateMediaItemsRequest {
  AlbumPosition? albumPosition;
  String? albumId;
  List<NewMediaItem>? newMediaItems;

  BatchCreateMediaItemsRequest(
      this.albumId, this.newMediaItems, this.albumPosition);

  static BatchCreateMediaItemsRequest inAlbum(
      String uploadToken, String albumId, String description) {
    return BatchCreateMediaItemsRequest(
        albumId,
        <NewMediaItem>[NewMediaItem.simple(uploadToken, description)],
        AlbumPosition.lastInAlbum());
  }

  factory BatchCreateMediaItemsRequest.fromJson(Map<String, dynamic> json) =>
      _$BatchCreateMediaItemsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BatchCreateMediaItemsRequestToJson(this);
}

@JsonSerializable()
class NewMediaItem {
  String? description;
  SimpleMediaItem? simpleMediaItem;

  NewMediaItem(this.description, this.simpleMediaItem);

  NewMediaItem.simple(String uploadToken, description) {
    this.description = description;
    simpleMediaItem = SimpleMediaItem(uploadToken);
  }

  factory NewMediaItem.fromJson(Map<String, dynamic> json) =>
      _$NewMediaItemFromJson(json);

  Map<String, dynamic> toJson() => _$NewMediaItemToJson(this);
}

@JsonSerializable()
class SimpleMediaItem {
  String? uploadToken;

  SimpleMediaItem(this.uploadToken);

  factory SimpleMediaItem.fromJson(Map<String, dynamic> json) =>
      _$SimpleMediaItemFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleMediaItemToJson(this);
}

@JsonSerializable()
class AlbumPosition {
  String? relativeMediaItemId;
  String? relativeEnrichmentItemId;
  PositionType? position;

  AlbumPosition(
      this.relativeMediaItemId, this.relativeEnrichmentItemId, this.position);

  AlbumPosition.absolute(this.position);

  factory AlbumPosition.fromJson(Map<String, dynamic> json) =>
      _$AlbumPositionFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumPositionToJson(this);

  static AlbumPosition lastInAlbum() =>
      AlbumPosition.absolute(PositionType.LAST_IN_ALBUM);
}

enum PositionType {
  POSITION_TYPE_UNSPECIFIED,
  FIRST_IN_ALBUM,
  LAST_IN_ALBUM,
  AFTER_MEDIA_ITEM,
  AFTER_ENRICHMENT_ITEM
}
