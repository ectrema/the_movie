import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie/application/injections/initializer.dart';
import 'package:the_movie/domain/entities/movie.entity.dart';
import 'package:the_movie/domain/mixins/favorite.mixin.dart';
import 'package:the_movie/domain/services/favorite.service.dart';
import 'package:the_movie/ui/abstraction/view_model_abs.dart';
import 'package:the_movie/ui/screens/favorite/favorite.state.dart';

///
final StateNotifierProvider<FavoriteViewModel, FavoriteState> favoriteProvider =
    StateNotifierProvider<FavoriteViewModel, FavoriteState>(
  (StateNotifierProviderRef<FavoriteViewModel, FavoriteState> ref) =>
      FavoriteViewModel(
    favoriteService: injector<FavoriteService>(),
  ),
);

class FavoriteViewModel extends ViewModelAbs<FavoriteViewModel, FavoriteState>
    with FavoriteMixin {
  final FavoriteService _favoriteService;

  FavoriteViewModel({
    required FavoriteService favoriteService,
  })  : _favoriteService = favoriteService,
        super(const FavoriteState.initial());

  ValueNotifier<List<MovieEntity>> get favoriteNotifer =>
      _favoriteService.favoriteNotifier;

  @override
  FavoriteService get favoriteService => _favoriteService;
}
