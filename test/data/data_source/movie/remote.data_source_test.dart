import 'package:test/test.dart';
import 'package:the_movie/data/data_source/movie/remote/remote.data_source.dart';
import 'package:the_movie/data/network/models/movie.model.dart';
import 'package:the_movie/data/network/models/result.model.dart';

class MockMovieRemoteDataSource implements MovieRemoteDataSource {
  final ResultModel expectedResult = ResultModel(
    1,
    <MovieModel>[
      MovieModel(
        false,
        'backdropPath',
        <int>[],
        1,
        'originalLanguage',
        'originalTitle',
        'overview',
        1.1,
        'posterPath',
        'releaseDate',
        'title',
        false,
        13,
        4,
      ),
    ],
    1,
    1,
  );

  @override
  Future<void> addToFavorite(bool favorite, int mediaId) async {
    return;
  }

  @override
  Future<ResultModel> getFavoriteMovie() async {
    return expectedResult;
  }

  @override
  Future<ResultModel> getMovie() async {
    return expectedResult;
  }
}

void main() {
  group('MovieRemoteDataSource', () {
    late MockMovieRemoteDataSource mockRemoteDataSource;

    setUp(() {
      mockRemoteDataSource = MockMovieRemoteDataSource();
    });

    test('getMovie fetches movie data successfully', () async {
      // Define expected result
      final ResultModel expectedResult = ResultModel(
        1,
        <MovieModel>[
          MovieModel(
            false,
            'backdropPath',
            <int>[],
            1,
            'originalLanguage',
            'originalTitle',
            'overview',
            1.1,
            'posterPath',
            'releaseDate',
            'title',
            false,
            13,
            4,
          ),
        ],
        1,
        1,
      );

      // Call the method
      final ResultModel result = await mockRemoteDataSource.getMovie();

      // Assert the result
      expect(result.page, expectedResult.page);
      expect(result.results?.length, expectedResult.results?.length);
      expect(result.totalPages, expectedResult.totalPages);
      expect(result.totalResults, expectedResult.totalResults);
    });

    test('getFavoriteMovie retrieves favorite movie data', () async {
      // Define expected result
      final ResultModel expectedResult = ResultModel(
        1,
        <MovieModel>[
          MovieModel(
            false,
            'backdropPath',
            <int>[],
            1,
            'originalLanguage',
            'originalTitle',
            'overview',
            1.1,
            'posterPath',
            'releaseDate',
            'title',
            false,
            13,
            4,
          ),
        ],
        1,
        1,
      );

      // Call the method
      final ResultModel result = await mockRemoteDataSource.getFavoriteMovie();

      // Assert the result
      expect(result.page, expectedResult.page);
      expect(result.results?.length, expectedResult.results?.length);
      expect(result.totalPages, expectedResult.totalPages);
      expect(result.totalResults, expectedResult.totalResults);
    });
  });
}
