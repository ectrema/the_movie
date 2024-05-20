import 'package:injectable/injectable.dart';
import 'package:the_movie/data/data_source/movie/remote/remote.data_source.dart';
import 'package:the_movie/data/network/models/result.model.dart';
import 'package:the_movie/domain/entities/result.entity.dart';
import 'package:the_movie/domain/repository/movie.repository.dart';

@Singleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;

  MovieRepositoryImpl({required MovieRemoteDataSource movieRemoteDataSource})
      : _movieRemoteDataSource = movieRemoteDataSource;

  @override
  Future<ResultEntity> getMovie() async {
    final ResultModel model = await _movieRemoteDataSource.getMovie();
    return model.toEntity;
  }

  @override
  Future<void> addToFavorite(bool favorite, int mediaId) {
    return _movieRemoteDataSource.addToFavorite(favorite, mediaId);
  }

  @override
  Future<ResultEntity> getFavoriteMovie() async {
    final ResultModel model = await _movieRemoteDataSource.getFavoriteMovie();
    return model.toEntity;
  }
}
