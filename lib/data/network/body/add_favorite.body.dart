import 'package:json_annotation/json_annotation.dart';

part 'add_favorite.body.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AddFavoriteBody {
  final String mediaType;
  final int mediaId;
  final bool favorite;

  factory AddFavoriteBody.fromJson(Map<String, dynamic> json) =>
      _$AddFavoriteBodyFromJson(json);

  AddFavoriteBody({
    this.mediaType = 'movie',
    required this.favorite,
    required this.mediaId,
  });

  Map<String, dynamic> toJson() => _$AddFavoriteBodyToJson(this);
}
