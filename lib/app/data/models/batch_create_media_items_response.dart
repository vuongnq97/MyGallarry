import 'package:json_annotation/json_annotation.dart';
import 'package:my_gallarry/app/data/models/media_item.dart';

part 'batch_create_media_items_response.g.dart';

@JsonSerializable()
class BatchCreateMediaItemsResponse {
  List<NewMediaItemResult>? newMediaItemResults;

  BatchCreateMediaItemsResponse(this.newMediaItemResults);

  factory BatchCreateMediaItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchCreateMediaItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BatchCreateMediaItemsResponseToJson(this);
}

@JsonSerializable()
class NewMediaItemResult {
  String? uploadToken;
  MediaItem? mediaItem;

  NewMediaItemResult(this.uploadToken, this.mediaItem);

  factory NewMediaItemResult.fromJson(Map<String, dynamic> json) =>
      _$NewMediaItemResultFromJson(json);

  Map<String, dynamic> toJson() => _$NewMediaItemResultToJson(this);
}
