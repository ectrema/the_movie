// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_favorite.body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFavoriteBody _$AddFavoriteBodyFromJson(Map<String, dynamic> json) =>
    AddFavoriteBody(
      mediaType: json['media_type'] as String? ?? 'movie',
      favorite: json['favorite'] as bool,
      mediaId: (json['media_id'] as num).toInt(),
    );

Map<String, dynamic> _$AddFavoriteBodyToJson(AddFavoriteBody instance) =>
    <String, dynamic>{
      'media_type': instance.mediaType,
      'media_id': instance.mediaId,
      'favorite': instance.favorite,
    };
