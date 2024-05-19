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

    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList.builder(
            itemBuilder: (_, int index) {
              final MovieEntity? item = state.resultEntity?.results[index];

              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Card(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                        child: item?.posterPath != null
                            ? Image.network(
                                'https://image.tmdb.org/t/p/original/${item!.posterPath}',
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Image.asset(
                                  'assets/images/not_found.jpeg',
                                ),
                              )
                            : null,
                      ),
                      Expanded(
                        child: Text(
                          item?.title ?? '',
                          textAlign: TextAlign.center,
                        ),
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
