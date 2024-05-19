import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie/ui/abstraction/view_state_abs.dart';

/// Base class for viewmodel
abstract class ViewModelAbs<T, S extends ViewStateAbs>
    extends StateNotifier<S> {
  ///
  ViewModelAbs(super.state);
}
