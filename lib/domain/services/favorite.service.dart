import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:the_movie/domain/entities/movie.entity.dart';
import 'package:the_movie/domain/entities/result.entity.dart';
import 'package:the_movie/domain/repository/movie.repository.dart';

@singleton
class FavoriteService {
  final MovieRepository _movieRepository;

  final ValueNotifier<List<MovieEntity>> _currentFavorite;

  ValueNotifier<List<MovieEntity>> get favoriteNotifier => _currentFavorite;

  FavoriteService({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        _currentFavorite = ValueNotifier<List<MovieEntity>>(<MovieEntity>[]) {
    _init();
  }

  Future<void> _init() async {
    try {
      final ResultEntity result = await _movieRepository.getFavoriteMovie();

      _currentFavorite.value = <MovieEntity>[...result.results];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addOrRemoveToFavorite(MovieEntity movieEntity) async {
    if (movieEntity.id == null) return;

    final int mediaId = movieEntity.id!;

    final bool contain = _currentFavorite.value.contains(movieEntity);
    try {
      if (contain) {
        await _movieRepository.addToFavorite(
          false,
          mediaId,
        );
        _currentFavorite.value = <MovieEntity>[
          ..._currentFavorite.value,
        ]..remove(movieEntity);
      } else {
        await _movieRepository.addToFavorite(
          true,
          mediaId,
        );
        _currentFavorite.value = <MovieEntity>[
          ..._currentFavorite.value,
          movieEntity,
        ];
      }
    } catch (e) {
      rethrow;
    }
  }
}
