import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:the_movie/domain/entities/result.entity.dart';
import 'package:the_movie/ui/abstraction/view_state_abs.dart';

part 'home.state.g.dart';

@CopyWith()
class HomeState extends ViewStateAbs {
  final bool loading;

  final ResultEntity? resultEntity;

  const HomeState({required this.resultEntity, required this.loading});

  const HomeState.initial()
      : loading = true,
        resultEntity = null;

  @override
  List<Object?> get props => <Object?>[
        loading,
        resultEntity,
      ];
}
