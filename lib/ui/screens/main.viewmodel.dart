import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie/ui/abstraction/view_model_abs.dart';
import 'package:the_movie/ui/screens/main.state.dart';

///
final StateNotifierProvider<MainViewModel, MainState> mainProvider =
    StateNotifierProvider<MainViewModel, MainState>(
  (StateNotifierProviderRef<MainViewModel, MainState> ref) => MainViewModel(),
);

class MainViewModel extends ViewModelAbs<MainViewModel, MainState> {
  MainViewModel() : super(const MainState.initial());

  void changeIndex(int index) {
    state = state.copyWith(index: index);
  }
}
