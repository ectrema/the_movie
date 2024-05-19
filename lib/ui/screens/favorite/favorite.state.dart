import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:the_movie/ui/abstraction/view_state_abs.dart';

part 'favorite.state.g.dart';

@CopyWith()
class FavoriteState extends ViewStateAbs {
  final bool loading;

  const FavoriteState({required this.loading});

  const FavoriteState.initial() : loading = true;

  @override
  List<Object?> get props => <Object?>[
        loading,
      ];
}
