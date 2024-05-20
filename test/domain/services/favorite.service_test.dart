import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:the_movie/domain/entities/movie.entity.dart';
import 'package:the_movie/domain/entities/result.entity.dart';
import 'package:the_movie/domain/repository/movie.repository.dart';
import 'package:the_movie/domain/services/favorite.service.dart';

import 'favorite.service_test.mocks.dart';

@GenerateNiceMocks(
  <MockSpec<dynamic>>[
    MockSpec<MovieRepository>(),
  ],
)
void main() {
  group('FavoriteService', () {
    late MockMovieRepository mockRepository;
    late FavoriteService favoriteService;

    setUp(() {
      mockRepository = MockMovieRepository();
      favoriteService = FavoriteService(movieRepository: mockRepository);
    });

    test('initializes favoriteNotifier with empty list', () async {
      when(mockRepository.getFavoriteMovie()).thenAnswer(
        (_) => Future<ResultEntity>.value(
          ResultEntity(
            results: <MovieEntity>[],
            page: 1,
            totalPages: 1,
            totalResults: 1,
          ),
        ),
      );

      await favoriteService.init();

      expect(favoriteService.favoriteNotifier.value, isEmpty);
    });

    test('fetches initial favorites on initialization (success)', () async {
      final ResultEntity expectedResult = ResultEntity(
        results: <MovieEntity>[MovieEntity(id: 1, title: 'Movie 1')],
      );
      when(mockRepository.getFavoriteMovie()).thenAnswer(
        (_) => Future<ResultEntity>.value(expectedResult),
      );

      await favoriteService.init();

      expect(
        favoriteService.favoriteNotifier.value,
        <MovieEntity>[expectedResult.results.first],
      );
    });

    test('throws exception on getFavoriteMovie error', () async {
      when(mockRepository.getFavoriteMovie()).thenThrow(Exception('Error'));

      expect(() => favoriteService.init(), throwsException);
    });

    test('correctly adds movie to favorites (not already present)', () async {
      final MovieEntity movie = MovieEntity(id: 2, title: 'Movie 2');
      when(mockRepository.addToFavorite(true, movie.id!))
          .thenAnswer((_) async {});

      await favoriteService.addOrRemoveToFavorite(movie);

      expect(favoriteService.favoriteNotifier.value, <MovieEntity>[movie]);
      verify(mockRepository.addToFavorite(true, movie.id!)).called(1);
    });

    test('correctly removes movie from favorites (already present)', () async {
      final MovieEntity movie = MovieEntity(id: 3, title: 'Movie 3');
      favoriteService.favoriteNotifier.value = <MovieEntity>[movie];

      when(mockRepository.addToFavorite(false, movie.id!))
          .thenAnswer((_) async {});

      await favoriteService.addOrRemoveToFavorite(movie);

      expect(favoriteService.favoriteNotifier.value, isEmpty);
      verify(mockRepository.addToFavorite(false, movie.id!)).called(1);
    });

    test('throws exception on addToFavorite error', () async {
      final MovieEntity movie = MovieEntity(id: 4, title: 'Movie 4');

      when(mockRepository.addToFavorite(any, any))
          .thenThrow(Exception('Error'));

      expect(
        () => favoriteService.addOrRemoveToFavorite(movie),
        throwsException,
      );
    });

    test('skips update when movie has no id', () async {
      final MovieEntity movie = MovieEntity(title: 'Missing ID');

      await favoriteService.addOrRemoveToFavorite(movie);

      verifyNever(mockRepository.addToFavorite(any, any));
    });
  });
}
