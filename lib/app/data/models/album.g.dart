// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album(
    id: json['id'] as String?,
    title: json['title'] as String?,
    productUrl: json['productUrl'] as String?,
    isWriteable: json['isWriteable'] as bool?,
    mediaItemsCount: json['mediaItemsCount'] as String?,
    coverPhotoBaseUrl: json['coverPhotoBaseUrl'] as String?,
    coverPhotoMediaItemId: json['coverPhotoMediaItemId'] as String?,
  );
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'productUrl': instance.productUrl,
      'isWriteable': instance.isWriteable,
      'mediaItemsCount': instance.mediaItemsCount,
      'coverPhotoBaseUrl': instance.coverPhotoBaseUrl,
      'coverPhotoMediaItemId': instance.coverPhotoMediaItemId,
    };
