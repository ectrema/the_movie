import 'package:test/test.dart';
import 'package:the_movie/domain/entities/movie.entity.dart';
import 'package:the_movie/domain/entities/result.entity.dart';
import 'package:the_movie/domain/repository/movie.repository.dart';

class MockMovieRepository implements MovieRepository {
  final ResultEntity expectedResult = ResultEntity(
    page: 1,
    results: <MovieEntity>[
      MovieEntity(
        adult: false,
        id: 1,
        title: 'title',
      ),
    ],
  );

  @override
  Future<void> addToFavorite(bool favorite, int mediaId) async {
    return;
  }

  @override
  Future<ResultEntity> getFavoriteMovie() async {
    return expectedResult;
  }

  @override
  Future<ResultEntity> getMovie() async {
    return expectedResult;
  }
}

void main() {
  group('MovieRepository', () {
    late MockMovieRepository mockRepository;

    setUp(() {
      mockRepository = MockMovieRepository();
    });

    test('getMovie fetches movie data successfully', () async {
      // Define expected result
      final ResultEntity expectedResult = ResultEntity(
        page: 1,
        results: <MovieEntity>[
          MovieEntity(
            adult: false,
            id: 1,
            title: 'title',
          ),
        ],
      );

      // Call the method
      final ResultEntity result = await mockRepository.getMovie();

      // Assert the result
      expect(result, expectedResult);
    });

    test('getFavoriteMovie retrieves favorite movie data', () async {
      // Define expected result
      final ResultEntity expectedResult = ResultEntity(
        page: 1,
        results: <MovieEntity>[
          MovieEntity(
            adult: false,
            id: 1,
            title: 'title',
          ),
        ],
      );

      // Call the method
      final ResultEntity result = await mockRepository.getFavoriteMovie();

      // Assert the result
      expect(result, expectedResult);
    });
  });
}
