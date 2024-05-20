import 'package:intl/intl.dart';
import 'package:test/test.dart';
import 'package:the_movie/domain/entities/movie.entity.dart';

void main() {
  group('MovieEntity', () {
    test(
        'props returns a list of all properties except voteCount and voteAverage',
        () {
      final MovieEntity movie = MovieEntity(
        id: 456,
        title: 'Another Movie',
        voteCount: 1000,
      );

      expect(movie.props, <Object?>[
        movie.adult,
        movie.backdropPath,
        movie.genreIds,
        movie.id,
        movie.originalLanguage,
        movie.originalTitle,
        movie.overview,
        movie.popularity,
        movie.posterPath,
        movie.releaseDate,
        movie.title,
        movie.video,
      ]);
    });

    test('parsedDateTime formats release date correctly (valid date)', () {
      final MovieEntity movie =
          MovieEntity(releaseDate: '2024-05-20'); // Today's date

      final String expectedFormattedDate =
          DateFormat.yMMMMd().format(DateTime.parse(movie.releaseDate!));
      expect(movie.parsedDateTime, expectedFormattedDate);
    });

    test('parsedDateTime returns empty string for invalid release date', () {
      final MovieEntity movie = MovieEntity(releaseDate: 'invalid-date');

      expect(movie.parsedDateTime, '');
    });
  });
}
