import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie/ui/abstraction/view_model_abs.dart';
import 'package:the_movie/ui/screens/favorite/favorite.state.dart';

///
final StateNotifierProvider<FavoriteViewModel, FavoriteState> favoriteProvider =
    StateNotifierProvider<FavoriteViewModel, FavoriteState>(
  (StateNotifierProviderRef<FavoriteViewModel, FavoriteState> ref) =>
      FavoriteViewModel(),
);

class FavoriteViewModel extends ViewModelAbs<FavoriteViewModel, FavoriteState> {
  FavoriteViewModel() : super(const FavoriteState.initial());
}
