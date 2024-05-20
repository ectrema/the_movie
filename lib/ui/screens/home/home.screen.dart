import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie/domain/entities/movie.entity.dart';
import 'package:the_movie/ui/screens/home/home.state.dart';
import 'package:the_movie/ui/screens/home/home.viewmodel.dart';
import 'package:the_movie/ui/widgets/movie.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The movie'),
        centerTitle: true,
        elevation: 4,
      ),
      body: const _MovieScreen(),
    );
  }
}

class _MovieScreen extends ConsumerWidget {
  const _MovieScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeState state = ref.watch(homeProvider);
    final HomeViewModel viewModel = ref.watch(homeProvider.notifier);

    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList.builder(
            itemBuilder: (_, int index) {
              final MovieEntity item = state.resultEntity!.results[index];

              return MovieWidget(
                item: item,
                onFavoriteTap: () => viewModel.addOrRemoveToFavorite(item),
                favoriteNotifer: viewModel.favoriteNotifer,
              );
            },
            itemCount: state.resultEntity?.results.length ?? 0,
          ),
          if (state.loading)
            const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
