import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie/data/network/models/movie.model.dart';
import 'package:the_movie/domain/entities/movie.entity.dart';
import 'package:the_movie/domain/entities/result.entity.dart';

part 'result.model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ResultModel {
  final int? page;
  final List<MovieModel>? results;
  final int? totalPages;
  final int? totalResults;

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);

  ResultModel(this.page, this.results, this.totalPages, this.totalResults);

  Map<String, dynamic> toJson() => _$ResultModelToJson(this);

  ResultEntity get toEntity => ResultEntity(
        results:
            results?.map<MovieEntity>((MovieModel e) => e.toEntity).toList() ??
                <MovieEntity>[],
        page: page,
        totalPages: totalPages,
        totalResults: totalResults,
      );
}
