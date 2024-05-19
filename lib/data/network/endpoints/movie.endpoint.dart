import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
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

  ///
  @GET('/discover/movie')
  Future<ResultModel> getMovie({
    @Query('language') String language = 'fr_FR',
    @Query('page') int page = 1,
  });
}
