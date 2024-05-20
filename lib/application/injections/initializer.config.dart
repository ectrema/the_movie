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
    as _i8;
import 'package:the_movie/data/data_source/movie/remote/remote.data_source.dart'
    as _i7;
import 'package:the_movie/data/network/endpoints/movie.endpoint.dart' as _i6;
import 'package:the_movie/data/repositories/movie/movie.repository_impl.dart'
    as _i10;
import 'package:the_movie/domain/repository/movie.repository.dart' as _i9;
import 'package:the_movie/domain/services/favorite.service.dart' as _i11;
import 'package:the_movie/foundation/client/dio.client.dart' as _i3;
import 'package:the_movie/foundation/client/interceptors/header.interceptor.dart'
    as _i5;
import 'package:the_movie/foundation/client/interceptors/token.interceptor.dart'
    as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.DioClient>(() => _i3.DioClient());
    gh.singleton<_i4.TokenInterceptor>(
        () => _i4.TokenInterceptor(dioClient: gh<_i3.DioClient>()));
    gh.singleton<_i5.HeaderInterceptor>(
        () => _i5.HeaderInterceptor(dioClient: gh<_i3.DioClient>()));
    gh.singleton<_i6.MovieEndpoint>(
        () => _i6.MovieEndpoint(gh<_i3.DioClient>()));
    gh.singleton<_i7.MovieRemoteDataSource>(() =>
        _i8.MovieRemoteDataSourceImpl(movieEndpoint: gh<_i6.MovieEndpoint>()));
    gh.singleton<_i9.MovieRepository>(() => _i10.MovieRepositoryImpl(
        movieRemoteDataSource: gh<_i7.MovieRemoteDataSource>()));
    gh.singleton<_i11.FavoriteService>(
        () => _i11.FavoriteService(movieRepository: gh<_i9.MovieRepository>()));
    return this;
  }
}
