import 'package:the_movie/data/network/models/result.model.dart';

abstract class MovieRemoteDataSource {
  Future<ResultModel> getMovie();

  Future<ResultModel> getFavoriteMovie();

  Future<void> addToFavorite(bool favorite, int mediaId);
}
