import 'package:json_annotation/json_annotation.dart';

part 'media_item.g.dart';

@JsonSerializable()
class MediaItem {
  String? id;
  String? description;
  String? productUrl;
  String? baseUrl;

  MediaItem(this.id, this.description, this.productUrl, this.baseUrl);

  factory MediaItem.fromJson(Map<String, dynamic> json) =>
      _$MediaItemFromJson(json);

  Map<String, dynamic> toJson() => _$MediaItemToJson(this);
}
