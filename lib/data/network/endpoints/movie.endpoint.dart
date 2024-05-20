import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:the_movie/data/network/body/add_favorite.body.dart';
import 'package:the_movie/data/network/models/result.model.dart';
import 'package:the_movie/foundation/client/dio.client.dart';

part 'movie.endpoint.g.dart';

///
/// [MovieEndpoint]
///
@RestApi()
@singleton
abstract class MovieEndpoint {
  ///
  @factoryMethod
  factory MovieEndpoint(DioClient dio) {
    return _MovieEndpoint(dio);
  }

  @GET('/discover/movie')
  Future<ResultModel> getMovie({
    @Query('language') String language = 'fr_FR',
    @Query('page') int page = 1,
  });

  /// no endpoint to get account_id, so I set it with env file
  @POST('/account/{account_id}/favorite')
  Future<void> addToFavorite({
    @Path('account_id') int accountId = const int.fromEnvironment('ACCOUNT_ID'),
    @Body() required AddFavoriteBody body,
  });
}
