import 'package:equatable/equatable.dart';
import 'package:the_movie/domain/entities/movie.entity.dart';

class ResultEntity with EquatableMixin {
  final int? page;
  final List<MovieEntity> results;
  final int? totalPages;
  final int? totalResults;

  ResultEntity({
    this.page,
    required this.results,
    this.totalPages,
    this.totalResults,
  });

  @override
  List<Object?> get props => <Object?>[
        page,
        results,
        totalPages,
        totalResults,
      ];
}
