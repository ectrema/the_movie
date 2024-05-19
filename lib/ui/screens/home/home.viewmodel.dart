import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie/application/injections/initializer.dart';
import 'package:the_movie/domain/entities/result.entity.dart';
import 'package:the_movie/domain/repository/movie.repository.dart';
import 'package:the_movie/ui/abstraction/view_model_abs.dart';
import 'package:the_movie/ui/screens/home/home.state.dart';

///
final StateNotifierProvider<HomeViewModel, HomeState> homeProvider =
    StateNotifierProvider<HomeViewModel, HomeState>(
  (StateNotifierProviderRef<HomeViewModel, HomeState> ref) => HomeViewModel(
    movieRepository: injector<MovieRepository>(),
  ),
);

class HomeViewModel extends ViewModelAbs<HomeViewModel, HomeState> {
  final MovieRepository _movieRepository;

  HomeViewModel({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(const HomeState.initial()) {
    _init();
  }

  void _updateLoading(bool value) {
    state = state.copyWith(loading: value);
  }

  Future<void> _init() async {
    if (!state.loading) _updateLoading(true);

    try {
      final ResultEntity result = await _movieRepository.getMovie();

      state = state.copyWith(resultEntity: result);
      _updateLoading(false);
    } catch (e) {
      _updateLoading(false);
      rethrow;
    }
  }
}
