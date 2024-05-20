import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie/application/injections/initializer.dart';
import 'package:the_movie/domain/entities/movie.entity.dart';
import 'package:the_movie/domain/entities/result.entity.dart';
import 'package:the_movie/domain/mixins/favorite.mixin.dart';
import 'package:the_movie/domain/repository/movie.repository.dart';
import 'package:the_movie/domain/services/connectivity.service.dart';
import 'package:the_movie/domain/services/favorite.service.dart';
import 'package:the_movie/ui/abstraction/view_model_abs.dart';
import 'package:the_movie/ui/screens/home/home.state.dart';

///
final StateNotifierProvider<HomeViewModel, HomeState> homeProvider =
    StateNotifierProvider<HomeViewModel, HomeState>(
  (StateNotifierProviderRef<HomeViewModel, HomeState> ref) => HomeViewModel(
    movieRepository: injector<MovieRepository>(),
    favoriteService: injector<FavoriteService>(),
    connectivityService: injector<ConnectivityService>(),
  ),
);

class HomeViewModel extends ViewModelAbs<HomeViewModel, HomeState>
    with FavoriteMixin {
  final MovieRepository _movieRepository;

  final FavoriteService _favoriteService;

  final ConnectivityService _connectivityService;

  HomeViewModel({
    required MovieRepository movieRepository,
    required FavoriteService favoriteService,
    required ConnectivityService connectivityService,
  })  : _movieRepository = movieRepository,
        _favoriteService = favoriteService,
        _connectivityService = connectivityService,
        super(const HomeState.initial()) {
    _init();
  }

  @override
  FavoriteService get favoriteService => _favoriteService;

  ValueNotifier<List<MovieEntity>> get favoriteNotifer =>
      _favoriteService.favoriteNotifier;

  void _updateLoading(bool value) {
    state = state.copyWith(loading: value);
  }

  bool get isConnected => _connectivityService.isConnected.value;

  void _init() {
    if (_connectivityService.isConnected.value) {
      _loadData();
    } else {
      _connectivityService.isConnected.addListener(() {
        if (_connectivityService.isConnected.value == true &&
            state.resultEntity == null) {
          _loadData();
        }
      });
      _updateLoading(false);
    }
  }

  Future<void> _loadData() async {
    unawaited(_favoriteService.init());
    if (!state.loading) _updateLoading(true);

    try {
      final ResultEntity result = await _movieRepository.getMovie();

      state = state.copyWith(resultEntity: result, loading: false);
    } catch (e) {
      _updateLoading(false);

      throw Exception('Failed to load movies');
    }
  }
}
