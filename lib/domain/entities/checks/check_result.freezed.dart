// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckResult {
  AICheckResult get ai => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckResultCopyWith<CheckResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckResultCopyWith<$Res> {
  factory $CheckResultCopyWith(
          CheckResult value, $Res Function(CheckResult) then) =
      _$CheckResultCopyWithImpl<$Res, CheckResult>;
  @useResult
  $Res call({AICheckResult ai});

  $AICheckResultCopyWith<$Res> get ai;
}

/// @nodoc
class _$CheckResultCopyWithImpl<$Res, $Val extends CheckResult>
    implements $CheckResultCopyWith<$Res> {
  _$CheckResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ai = null,
  }) {
    return _then(_value.copyWith(
      ai: null == ai
          ? _value.ai
          : ai // ignore: cast_nullable_to_non_nullable
              as AICheckResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AICheckResultCopyWith<$Res> get ai {
    return $AICheckResultCopyWith<$Res>(_value.ai, (value) {
      return _then(_value.copyWith(ai: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CheckResultCopyWith<$Res>
    implements $CheckResultCopyWith<$Res> {
  factory _$$_CheckResultCopyWith(
          _$_CheckResult value, $Res Function(_$_CheckResult) then) =
      __$$_CheckResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AICheckResult ai});

  @override
  $AICheckResultCopyWith<$Res> get ai;
}

/// @nodoc
class __$$_CheckResultCopyWithImpl<$Res>
    extends _$CheckResultCopyWithImpl<$Res, _$_CheckResult>
    implements _$$_CheckResultCopyWith<$Res> {
  __$$_CheckResultCopyWithImpl(
      _$_CheckResult _value, $Res Function(_$_CheckResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ai = null,
  }) {
    return _then(_$_CheckResult(
      ai: null == ai
          ? _value.ai
          : ai // ignore: cast_nullable_to_non_nullable
              as AICheckResult,
    ));
  }
}

/// @nodoc

class _$_CheckResult implements _CheckResult {
  const _$_CheckResult({required this.ai});

  @override
  final AICheckResult ai;

  @override
  String toString() {
    return 'CheckResult(ai: $ai)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckResult &&
            (identical(other.ai, ai) || other.ai == ai));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ai);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckResultCopyWith<_$_CheckResult> get copyWith =>
      __$$_CheckResultCopyWithImpl<_$_CheckResult>(this, _$identity);
}

abstract class _CheckResult implements CheckResult {
  const factory _CheckResult({required final AICheckResult ai}) =
      _$_CheckResult;

  @override
  AICheckResult get ai;
  @override
  @JsonKey(ignore: true)
  _$$_CheckResultCopyWith<_$_CheckResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AICheckResult {
  AIClassification get classification => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AICheckResultCopyWith<AICheckResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AICheckResultCopyWith<$Res> {
  factory $AICheckResultCopyWith(
          AICheckResult value, $Res Function(AICheckResult) then) =
      _$AICheckResultCopyWithImpl<$Res, AICheckResult>;
  @useResult
  $Res call({AIClassification classification, double score});
}

/// @nodoc
class _$AICheckResultCopyWithImpl<$Res, $Val extends AICheckResult>
    implements $AICheckResultCopyWith<$Res> {
  _$AICheckResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classification = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      classification: null == classification
          ? _value.classification
          : classification // ignore: cast_nullable_to_non_nullable
              as AIClassification,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AICheckResultCopyWith<$Res>
    implements $AICheckResultCopyWith<$Res> {
  factory _$$_AICheckResultCopyWith(
          _$_AICheckResult value, $Res Function(_$_AICheckResult) then) =
      __$$_AICheckResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AIClassification classification, double score});
}

/// @nodoc
class __$$_AICheckResultCopyWithImpl<$Res>
    extends _$AICheckResultCopyWithImpl<$Res, _$_AICheckResult>
    implements _$$_AICheckResultCopyWith<$Res> {
  __$$_AICheckResultCopyWithImpl(
      _$_AICheckResult _value, $Res Function(_$_AICheckResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classification = null,
    Object? score = null,
  }) {
    return _then(_$_AICheckResult(
      classification: null == classification
          ? _value.classification
          : classification // ignore: cast_nullable_to_non_nullable
              as AIClassification,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_AICheckResult implements _AICheckResult {
  const _$_AICheckResult({required this.classification, required this.score});

  @override
  final AIClassification classification;
  @override
  final double score;

  @override
  String toString() {
    return 'AICheckResult(classification: $classification, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AICheckResult &&
            (identical(other.classification, classification) ||
                other.classification == classification) &&
            (identical(other.score, score) || other.score == score));
  }

  @override
  int get hashCode => Object.hash(runtimeType, classification, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AICheckResultCopyWith<_$_AICheckResult> get copyWith =>
      __$$_AICheckResultCopyWithImpl<_$_AICheckResult>(this, _$identity);
}

abstract class _AICheckResult implements AICheckResult {
  const factory _AICheckResult(
      {required final AIClassification classification,
      required final double score}) = _$_AICheckResult;

  @override
  AIClassification get classification;
  @override
  double get score;
  @override
  @JsonKey(ignore: true)
  _$$_AICheckResultCopyWith<_$_AICheckResult> get copyWith =>
      throw _privateConstructorUsedError;
}
