import 'package:the_movie/domain/entities/movie.entity.dart';
import 'package:the_movie/domain/services/favorite.service.dart';

mixin FavoriteMixin {
  abstract final FavoriteService favoriteService;

  Future<void> addOrRemoveToFavorite(MovieEntity? movieEntity) async {
    if (movieEntity == null) return;

    return favoriteService.addOrRemoveToFavorite(movieEntity);
  }
}
