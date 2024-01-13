// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Document {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  CheckResult? get checkResult => throw _privateConstructorUsedError;
  DateTime? get lastCheckedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)
        $default, {
    required TResult Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)
        empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    TResult? Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)?
        empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    TResult Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)?
        empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Document value) $default, {
    required TResult Function(_Empty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Document value)? $default, {
    TResult? Function(_Empty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Document value)? $default, {
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DocumentCopyWith<Document> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentCopyWith<$Res> {
  factory $DocumentCopyWith(Document value, $Res Function(Document) then) =
      _$DocumentCopyWithImpl<$Res, Document>;
  @useResult
  $Res call(
      {String id,
      String title,
      String text,
      CheckResult? checkResult,
      DateTime? lastCheckedAt,
      DateTime createdAt,
      DateTime updatedAt});

  $CheckResultCopyWith<$Res>? get checkResult;
}

/// @nodoc
class _$DocumentCopyWithImpl<$Res, $Val extends Document>
    implements $DocumentCopyWith<$Res> {
  _$DocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? text = null,
    Object? checkResult = freezed,
    Object? lastCheckedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      checkResult: freezed == checkResult
          ? _value.checkResult
          : checkResult // ignore: cast_nullable_to_non_nullable
              as CheckResult?,
      lastCheckedAt: freezed == lastCheckedAt
          ? _value.lastCheckedAt
          : lastCheckedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CheckResultCopyWith<$Res>? get checkResult {
    if (_value.checkResult == null) {
      return null;
    }

    return $CheckResultCopyWith<$Res>(_value.checkResult!, (value) {
      return _then(_value.copyWith(checkResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DocumentCopyWith<$Res> implements $DocumentCopyWith<$Res> {
  factory _$$_DocumentCopyWith(
          _$_Document value, $Res Function(_$_Document) then) =
      __$$_DocumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String text,
      CheckResult? checkResult,
      DateTime? lastCheckedAt,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $CheckResultCopyWith<$Res>? get checkResult;
}

/// @nodoc
class __$$_DocumentCopyWithImpl<$Res>
    extends _$DocumentCopyWithImpl<$Res, _$_Document>
    implements _$$_DocumentCopyWith<$Res> {
  __$$_DocumentCopyWithImpl(
      _$_Document _value, $Res Function(_$_Document) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? text = null,
    Object? checkResult = freezed,
    Object? lastCheckedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_Document(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      checkResult: freezed == checkResult
          ? _value.checkResult
          : checkResult // ignore: cast_nullable_to_non_nullable
              as CheckResult?,
      lastCheckedAt: freezed == lastCheckedAt
          ? _value.lastCheckedAt
          : lastCheckedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Document implements _Document {
  const _$_Document(
      {required this.id,
      required this.title,
      required this.text,
      this.checkResult,
      this.lastCheckedAt,
      required this.createdAt,
      required this.updatedAt});

  @override
  final String id;
  @override
  final String title;
  @override
  final String text;
  @override
  final CheckResult? checkResult;
  @override
  final DateTime? lastCheckedAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Document(id: $id, title: $title, text: $text, checkResult: $checkResult, lastCheckedAt: $lastCheckedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Document &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.checkResult, checkResult) ||
                other.checkResult == checkResult) &&
            (identical(other.lastCheckedAt, lastCheckedAt) ||
                other.lastCheckedAt == lastCheckedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, text, checkResult,
      lastCheckedAt, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocumentCopyWith<_$_Document> get copyWith =>
      __$$_DocumentCopyWithImpl<_$_Document>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)
        $default, {
    required TResult Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)
        empty,
  }) {
    return $default(
        id, title, text, checkResult, lastCheckedAt, createdAt, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    TResult? Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)?
        empty,
  }) {
    return $default?.call(
        id, title, text, checkResult, lastCheckedAt, createdAt, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    TResult Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)?
        empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          id, title, text, checkResult, lastCheckedAt, createdAt, updatedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Document value) $default, {
    required TResult Function(_Empty value) empty,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Document value)? $default, {
    TResult? Function(_Empty value)? empty,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Document value)? $default, {
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _Document implements Document {
  const factory _Document(
      {required final String id,
      required final String title,
      required final String text,
      final CheckResult? checkResult,
      final DateTime? lastCheckedAt,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$_Document;

  @override
  String get id;
  @override
  String get title;
  @override
  String get text;
  @override
  CheckResult? get checkResult;
  @override
  DateTime? get lastCheckedAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentCopyWith<_$_Document> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EmptyCopyWith<$Res> implements $DocumentCopyWith<$Res> {
  factory _$$_EmptyCopyWith(_$_Empty value, $Res Function(_$_Empty) then) =
      __$$_EmptyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String text,
      CheckResult? checkResult,
      DateTime? lastCheckedAt,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $CheckResultCopyWith<$Res>? get checkResult;
}

/// @nodoc
class __$$_EmptyCopyWithImpl<$Res>
    extends _$DocumentCopyWithImpl<$Res, _$_Empty>
    implements _$$_EmptyCopyWith<$Res> {
  __$$_EmptyCopyWithImpl(_$_Empty _value, $Res Function(_$_Empty) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? text = null,
    Object? checkResult = freezed,
    Object? lastCheckedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_Empty(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      checkResult: freezed == checkResult
          ? _value.checkResult
          : checkResult // ignore: cast_nullable_to_non_nullable
              as CheckResult?,
      lastCheckedAt: freezed == lastCheckedAt
          ? _value.lastCheckedAt
          : lastCheckedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Empty implements _Empty {
  const _$_Empty(
      {this.id = '',
      this.title = '',
      this.text = '',
      this.checkResult,
      this.lastCheckedAt,
      this.createdAt = const ConstDateTime.fromMillisecondsSinceEpoch(0),
      this.updatedAt = const ConstDateTime.fromMillisecondsSinceEpoch(0)});

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String text;
  @override
  final CheckResult? checkResult;
  @override
  final DateTime? lastCheckedAt;
  @override
  @JsonKey()
  final DateTime createdAt;
  @override
  @JsonKey()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Document.empty(id: $id, title: $title, text: $text, checkResult: $checkResult, lastCheckedAt: $lastCheckedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Empty &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.checkResult, checkResult) ||
                other.checkResult == checkResult) &&
            (identical(other.lastCheckedAt, lastCheckedAt) ||
                other.lastCheckedAt == lastCheckedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, text, checkResult,
      lastCheckedAt, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmptyCopyWith<_$_Empty> get copyWith =>
      __$$_EmptyCopyWithImpl<_$_Empty>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)
        $default, {
    required TResult Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)
        empty,
  }) {
    return empty(
        id, title, text, checkResult, lastCheckedAt, createdAt, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    TResult? Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)?
        empty,
  }) {
    return empty?.call(
        id, title, text, checkResult, lastCheckedAt, createdAt, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    TResult Function(
            String id,
            String title,
            String text,
            CheckResult? checkResult,
            DateTime? lastCheckedAt,
            DateTime createdAt,
            DateTime updatedAt)?
        empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(
          id, title, text, checkResult, lastCheckedAt, createdAt, updatedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Document value) $default, {
    required TResult Function(_Empty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Document value)? $default, {
    TResult? Function(_Empty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Document value)? $default, {
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements Document {
  const factory _Empty(
      {final String id,
      final String title,
      final String text,
      final CheckResult? checkResult,
      final DateTime? lastCheckedAt,
      final DateTime createdAt,
      final DateTime updatedAt}) = _$_Empty;

  @override
  String get id;
  @override
  String get title;
  @override
  String get text;
  @override
  CheckResult? get checkResult;
  @override
  DateTime? get lastCheckedAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_EmptyCopyWith<_$_Empty> get copyWith =>
      throw _privateConstructorUsedError;
}
