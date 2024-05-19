import 'package:the_movie/domain/entities/result.entity.dart';

abstract class MovieRepository {
  Future<ResultEntity> getMovie();
}
