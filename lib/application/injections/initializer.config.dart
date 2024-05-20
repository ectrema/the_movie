// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:the_movie/data/data_source/movie/remote/impl/remote.data_source_impl.dart'
    as _i9;
import 'package:the_movie/data/data_source/movie/remote/remote.data_source.dart'
    as _i8;
import 'package:the_movie/data/network/endpoints/movie.endpoint.dart' as _i7;
import 'package:the_movie/data/repositories/movie/movie.repository_impl.dart'
    as _i11;
import 'package:the_movie/domain/repository/movie.repository.dart' as _i10;
import 'package:the_movie/domain/services/connectivity.service.dart' as _i4;
import 'package:the_movie/domain/services/favorite.service.dart' as _i12;
import 'package:the_movie/foundation/client/dio.client.dart' as _i3;
import 'package:the_movie/foundation/client/interceptors/header.interceptor.dart'
    as _i6;
import 'package:the_movie/foundation/client/interceptors/token.interceptor.dart'
    as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.DioClient>(() => _i3.DioClient());
    await gh.singletonAsync<_i4.ConnectivityService>(
      () => _i4.ConnectivityService.inject(),
      preResolve: true,
    );
    gh.singleton<_i5.TokenInterceptor>(
        () => _i5.TokenInterceptor(dioClient: gh<_i3.DioClient>()));
    gh.singleton<_i6.HeaderInterceptor>(
        () => _i6.HeaderInterceptor(dioClient: gh<_i3.DioClient>()));
    gh.singleton<_i7.MovieEndpoint>(
        () => _i7.MovieEndpoint(gh<_i3.DioClient>()));
    gh.singleton<_i8.MovieRemoteDataSource>(() =>
        _i9.MovieRemoteDataSourceImpl(movieEndpoint: gh<_i7.MovieEndpoint>()));
    gh.singleton<_i10.MovieRepository>(() => _i11.MovieRepositoryImpl(
        movieRemoteDataSource: gh<_i8.MovieRemoteDataSource>()));
    gh.singleton<_i12.FavoriteService>(() =>
        _i12.FavoriteService(movieRepository: gh<_i10.MovieRepository>()));
    return this;
  }
}
