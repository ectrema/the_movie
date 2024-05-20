// Mocks generated by Mockito 5.4.4 from annotations
// in the_movie/test/screens/home/home.viewmodel_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flutter/material.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:the_movie/domain/entities/movie.entity.dart' as _i4;
import 'package:the_movie/domain/services/connectivity.service.dart' as _i6;
import 'package:the_movie/domain/services/favorite.service.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeValueNotifier_0<T> extends _i1.SmartFake
    implements _i2.ValueNotifier<T> {
  _FakeValueNotifier_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FavoriteService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFavoriteService extends _i1.Mock implements _i3.FavoriteService {
  @override
  _i2.ValueNotifier<List<_i4.MovieEntity>> get favoriteNotifier =>
      (super.noSuchMethod(
        Invocation.getter(#favoriteNotifier),
        returnValue: _FakeValueNotifier_0<List<_i4.MovieEntity>>(
          this,
          Invocation.getter(#favoriteNotifier),
        ),
        returnValueForMissingStub: _FakeValueNotifier_0<List<_i4.MovieEntity>>(
          this,
          Invocation.getter(#favoriteNotifier),
        ),
      ) as _i2.ValueNotifier<List<_i4.MovieEntity>>);

  @override
  _i5.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> addOrRemoveToFavorite(_i4.MovieEntity? movieEntity) =>
      (super.noSuchMethod(
        Invocation.method(
          #addOrRemoveToFavorite,
          [movieEntity],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [ConnectivityService].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectivityService extends _i1.Mock
    implements _i6.ConnectivityService {
  @override
  _i2.ValueNotifier<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _FakeValueNotifier_0<bool>(
          this,
          Invocation.getter(#isConnected),
        ),
        returnValueForMissingStub: _FakeValueNotifier_0<bool>(
          this,
          Invocation.getter(#isConnected),
        ),
      ) as _i2.ValueNotifier<bool>);
}
