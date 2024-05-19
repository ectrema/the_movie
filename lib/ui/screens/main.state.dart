import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:the_movie/ui/abstraction/view_state_abs.dart';

part 'main.state.g.dart';

@CopyWith()
class MainState extends ViewStateAbs {
  final int index;

  const MainState({required this.index});

  const MainState.initial() : index = 0;

  @override
  List<Object?> get props => <Object?>[index];
}
