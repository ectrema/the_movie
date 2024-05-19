// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FavoriteStateCWProxy {
  FavoriteState loading(bool loading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FavoriteState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FavoriteState(...).copyWith(id: 12, name: "My name")
  /// ````
  FavoriteState call({
    bool? loading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFavoriteState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFavoriteState.copyWith.fieldName(...)`
class _$FavoriteStateCWProxyImpl implements _$FavoriteStateCWProxy {
  const _$FavoriteStateCWProxyImpl(this._value);

  final FavoriteState _value;

  @override
  FavoriteState loading(bool loading) => this(loading: loading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FavoriteState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FavoriteState(...).copyWith(id: 12, name: "My name")
  /// ````
  FavoriteState call({
    Object? loading = const $CopyWithPlaceholder(),
  }) {
    return FavoriteState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
    );
  }
}

extension $FavoriteStateCopyWith on FavoriteState {
  /// Returns a callable class that can be used as follows: `instanceOfFavoriteState.copyWith(...)` or like so:`instanceOfFavoriteState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FavoriteStateCWProxy get copyWith => _$FavoriteStateCWProxyImpl(this);
}
