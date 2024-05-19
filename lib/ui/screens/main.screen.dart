import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie/ui/screens/favorite/favorite.screen.dart';
import 'package:the_movie/ui/screens/home/home.screen.dart';
import 'package:the_movie/ui/screens/main.state.dart';
import 'package:the_movie/ui/screens/main.viewmodel.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreeenState();
}

class _MainScreeenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final MainState state = ref.watch(mainProvider);
    final MainViewModel viewModel = ref.read(mainProvider.notifier);

    return Scaffold(
      body: state.index == 0 ? const HomeScreen() : const FavoriteScreen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: viewModel.changeIndex,
        currentIndex: state.index,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
