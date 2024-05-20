import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:the_movie/domain/entities/movie.entity.dart';
import 'package:the_movie/domain/entities/result.entity.dart';
import 'package:the_movie/domain/services/connectivity.service.dart';
import 'package:the_movie/domain/services/favorite.service.dart';
import 'package:the_movie/ui/screens/home/home.viewmodel.dart';

import '../../domain/services/favorite.service_test.mocks.dart';
import 'home.viewmodel_test.mocks.dart';

@GenerateNiceMocks(
  <MockSpec<dynamic>>[
    MockSpec<FavoriteService>(),
    MockSpec<ConnectivityService>(),
  ],
)
void main() {
  group('HomeViewModel', () {
    late MockMovieRepository mockMovieRepository;
    late MockFavoriteService mockFavoriteService;
    late MockConnectivityService mockConnectivityService;
    late HomeViewModel viewModel;

    setUp(() {
      mockMovieRepository = MockMovieRepository();
      mockFavoriteService = MockFavoriteService();
      mockConnectivityService = MockConnectivityService();
      when(mockConnectivityService.isConnected)
          .thenReturn(ValueNotifier<bool>(true));
      viewModel = HomeViewModel(
        movieRepository: mockMovieRepository,
        favoriteService: mockFavoriteService,
        connectivityService: mockConnectivityService,
      );
    });

    test('initializes favorite service on creation and updates loading',
        () async {
      when(mockFavoriteService.init()).thenAnswer((_) async {});
      when(mockMovieRepository.getMovie())
          .thenAnswer((_) async => ResultEntity(results: <MovieEntity>[]));

      verify(mockFavoriteService.init()).called(1);
      verify(mockMovieRepository.getMovie()).called(1);
      expect(viewModel.state.loading, false);
    });

    test('addOrRemoveToFavorite delegates to favoriteService', () async {
      final MovieEntity movie = MovieEntity(id: 2, title: 'Movie 2');
      await viewModel.addOrRemoveToFavorite(movie);

      verify(mockFavoriteService.addOrRemoveToFavorite(movie)).called(1);
    });
  });
}
