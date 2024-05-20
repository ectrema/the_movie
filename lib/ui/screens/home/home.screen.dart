import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie/domain/entities/movie.entity.dart';
import 'package:the_movie/ui/screens/home/home.state.dart';
import 'package:the_movie/ui/screens/home/home.viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _MovieScreen(),
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
              final MovieEntity? item = state.resultEntity?.results[index];

              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                        child: item?.posterPath != null
                            ? ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/original/${item!.posterPath}',
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Image.asset(
                                    'assets/images/not_found.jpeg',
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item?.title ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              item?.parsedDateTime ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                item?.overview ?? '',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: ValueListenableBuilder<List<MovieEntity>>(
                          valueListenable: viewModel.favoriteNotifer,
                          builder: (_, List<MovieEntity> value, __) {
                            return Icon(
                              value.contains(item)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            );
                          },
                        ),
                        onPressed: () => viewModel.addOrRemoveToFavorite(item),
                      ),
                    ],
                  ),
                ),
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
