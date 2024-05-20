import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie/domain/entities/movie.entity.dart';
import 'package:the_movie/ui/screens/favorite/favorite.viewmodel.dart';
import 'package:the_movie/ui/widgets/movie.widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _FavoriteBody(),
    );
  }
}

class _FavoriteBody extends ConsumerWidget {
  const _FavoriteBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FavoriteViewModel viewModel = ref.watch(favoriteProvider.notifier);

    return ValueListenableBuilder<List<MovieEntity>>(
      valueListenable: viewModel.favoriteNotifer,
      builder: (_, List<MovieEntity> value, __) {
        return SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList.builder(
                itemBuilder: (_, int index) {
                  final MovieEntity item = value[index];

                  return MovieWidget(
                    item: item,
                    onFavoriteTap: () => viewModel.addOrRemoveToFavorite(item),
                    favoriteNotifer: viewModel.favoriteNotifer,
                  );
                },
                itemCount: value.length,
              ),
            ],
          ),
        );
      },
    );
  }
}
