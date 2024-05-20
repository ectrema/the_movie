import 'package:injectable/injectable.dart';
import 'package:the_movie/data/data_source/movie/remote/remote.data_source.dart';
import 'package:the_movie/data/network/body/add_favorite.body.dart';
import 'package:the_movie/data/network/endpoints/movie.endpoint.dart';
import 'package:the_movie/data/network/models/result.model.dart';

@Singleton(as: MovieRemoteDataSource)
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final MovieEndpoint _movieEndpoint;

  MovieRemoteDataSourceImpl({required MovieEndpoint movieEndpoint})
      : _movieEndpoint = movieEndpoint;
  @override
  Future<ResultModel> getMovie() {
    return _movieEndpoint.getMovie();
  }

  @override
  Future<void> addToFavorite(bool favorite, int mediaId) {
    return _movieEndpoint.addToFavorite(
      body: AddFavoriteBody(favorite: favorite, mediaId: mediaId),
    );
  }
}
