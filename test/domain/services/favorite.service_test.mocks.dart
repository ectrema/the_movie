// Mocks generated by Mockito 5.4.4 from annotations
// in the_movie/test/domain/services/favorite.service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:the_movie/domain/entities/result.entity.dart' as _i2;
import 'package:the_movie/domain/repository/movie.repository.dart' as _i3;

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

class _FakeResultEntity_0 extends _i1.SmartFake implements _i2.ResultEntity {
  _FakeResultEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i3.MovieRepository {
  @override
  _i4.Future<_i2.ResultEntity> getMovie() => (super.noSuchMethod(
        Invocation.method(
          #getMovie,
          [],
        ),
        returnValue: _i4.Future<_i2.ResultEntity>.value(_FakeResultEntity_0(
          this,
          Invocation.method(
            #getMovie,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.ResultEntity>.value(_FakeResultEntity_0(
          this,
          Invocation.method(
            #getMovie,
            [],
          ),
        )),
      ) as _i4.Future<_i2.ResultEntity>);

  @override
  _i4.Future<void> addToFavorite(
    bool? favorite,
    int? mediaId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addToFavorite,
          [
            favorite,
            mediaId,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<_i2.ResultEntity> getFavoriteMovie() => (super.noSuchMethod(
        Invocation.method(
          #getFavoriteMovie,
          [],
        ),
        returnValue: _i4.Future<_i2.ResultEntity>.value(_FakeResultEntity_0(
          this,
          Invocation.method(
            #getFavoriteMovie,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.ResultEntity>.value(_FakeResultEntity_0(
          this,
          Invocation.method(
            #getFavoriteMovie,
            [],
          ),
        )),
      ) as _i4.Future<_i2.ResultEntity>);
}
