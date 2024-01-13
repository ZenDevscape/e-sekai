// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_doc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SingleDocState {
  Document get document => throw _privateConstructorUsedError;
  SingleDocAction get action => throw _privateConstructorUsedError;
  SingleDocFailure get failure => throw _privateConstructorUsedError;
  bool get saved => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)
        initial,
    required TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)
        edit,
    required TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        initial,
    TResult? Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        edit,
    TResult? Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        initial,
    TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        edit,
    TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SingleDocStateCopyWith<SingleDocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleDocStateCopyWith<$Res> {
  factory $SingleDocStateCopyWith(
          SingleDocState value, $Res Function(SingleDocState) then) =
      _$SingleDocStateCopyWithImpl<$Res, SingleDocState>;
  @useResult
  $Res call(
      {Document document,
      SingleDocAction action,
      SingleDocFailure failure,
      bool saved});

  $DocumentCopyWith<$Res> get document;
}

/// @nodoc
class _$SingleDocStateCopyWithImpl<$Res, $Val extends SingleDocState>
    implements $SingleDocStateCopyWith<$Res> {
  _$SingleDocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document = null,
    Object? action = null,
    Object? failure = null,
    Object? saved = null,
  }) {
    return _then(_value.copyWith(
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as Document,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as SingleDocAction,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as SingleDocFailure,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DocumentCopyWith<$Res> get document {
    return $DocumentCopyWith<$Res>(_value.document, (value) {
      return _then(_value.copyWith(document: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $SingleDocStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Document document,
      SingleDocAction action,
      SingleDocFailure failure,
      bool saved});

  @override
  $DocumentCopyWith<$Res> get document;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SingleDocStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document = null,
    Object? action = null,
    Object? failure = null,
    Object? saved = null,
  }) {
    return _then(_$_Initial(
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as Document,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as SingleDocAction,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as SingleDocFailure,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial(
      {this.document = const Document.empty(),
      this.action = SingleDocAction.none,
      this.failure = SingleDocFailure.none,
      this.saved = false});

  @override
  @JsonKey()
  final Document document;
  @override
  @JsonKey()
  final SingleDocAction action;
  @override
  @JsonKey()
  final SingleDocFailure failure;
  @override
  @JsonKey()
  final bool saved;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SingleDocState.initial(document: $document, action: $action, failure: $failure, saved: $saved)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SingleDocState.initial'))
      ..add(DiagnosticsProperty('document', document))
      ..add(DiagnosticsProperty('action', action))
      ..add(DiagnosticsProperty('failure', failure))
      ..add(DiagnosticsProperty('saved', saved));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.document, document) ||
                other.document == document) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.saved, saved) || other.saved == saved));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, document, action, failure, saved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)
        initial,
    required TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)
        edit,
    required TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)
        loaded,
  }) {
    return initial(document, action, failure, saved);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        initial,
    TResult? Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        edit,
    TResult? Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        loaded,
  }) {
    return initial?.call(document, action, failure, saved);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        initial,
    TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        edit,
    TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(document, action, failure, saved);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Loaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SingleDocState {
  const factory _Initial(
      {final Document document,
      final SingleDocAction action,
      final SingleDocFailure failure,
      final bool saved}) = _$_Initial;

  @override
  Document get document;
  @override
  SingleDocAction get action;
  @override
  SingleDocFailure get failure;
  @override
  bool get saved;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EditCopyWith<$Res> implements $SingleDocStateCopyWith<$Res> {
  factory _$$_EditCopyWith(_$_Edit value, $Res Function(_$_Edit) then) =
      __$$_EditCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Document document,
      SingleDocAction action,
      SingleDocFailure failure,
      bool saved});

  @override
  $DocumentCopyWith<$Res> get document;
}

/// @nodoc
class __$$_EditCopyWithImpl<$Res>
    extends _$SingleDocStateCopyWithImpl<$Res, _$_Edit>
    implements _$$_EditCopyWith<$Res> {
  __$$_EditCopyWithImpl(_$_Edit _value, $Res Function(_$_Edit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document = null,
    Object? action = null,
    Object? failure = null,
    Object? saved = null,
  }) {
    return _then(_$_Edit(
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as Document,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as SingleDocAction,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as SingleDocFailure,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Edit with DiagnosticableTreeMixin implements _Edit {
  const _$_Edit(
      {required this.document,
      required this.action,
      required this.failure,
      required this.saved});

  @override
  final Document document;
  @override
  final SingleDocAction action;
  @override
  final SingleDocFailure failure;
  @override
  final bool saved;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SingleDocState.edit(document: $document, action: $action, failure: $failure, saved: $saved)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SingleDocState.edit'))
      ..add(DiagnosticsProperty('document', document))
      ..add(DiagnosticsProperty('action', action))
      ..add(DiagnosticsProperty('failure', failure))
      ..add(DiagnosticsProperty('saved', saved));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Edit &&
            (identical(other.document, document) ||
                other.document == document) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.saved, saved) || other.saved == saved));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, document, action, failure, saved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditCopyWith<_$_Edit> get copyWith =>
      __$$_EditCopyWithImpl<_$_Edit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)
        initial,
    required TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)
        edit,
    required TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)
        loaded,
  }) {
    return edit(document, action, failure, saved);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        initial,
    TResult? Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        edit,
    TResult? Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        loaded,
  }) {
    return edit?.call(document, action, failure, saved);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        initial,
    TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        edit,
    TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        loaded,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(document, action, failure, saved);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Loaded value) loaded,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class _Edit implements SingleDocState {
  const factory _Edit(
      {required final Document document,
      required final SingleDocAction action,
      required final SingleDocFailure failure,
      required final bool saved}) = _$_Edit;

  @override
  Document get document;
  @override
  SingleDocAction get action;
  @override
  SingleDocFailure get failure;
  @override
  bool get saved;
  @override
  @JsonKey(ignore: true)
  _$$_EditCopyWith<_$_Edit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res>
    implements $SingleDocStateCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Document document,
      SingleDocAction action,
      SingleDocFailure failure,
      bool saved});

  @override
  $DocumentCopyWith<$Res> get document;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$SingleDocStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document = null,
    Object? action = null,
    Object? failure = null,
    Object? saved = null,
  }) {
    return _then(_$_Loaded(
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as Document,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as SingleDocAction,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as SingleDocFailure,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Loaded with DiagnosticableTreeMixin implements _Loaded {
  const _$_Loaded(
      {required this.document,
      required this.action,
      required this.failure,
      required this.saved});

  @override
  final Document document;
  @override
  final SingleDocAction action;
  @override
  final SingleDocFailure failure;
  @override
  final bool saved;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SingleDocState.loaded(document: $document, action: $action, failure: $failure, saved: $saved)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SingleDocState.loaded'))
      ..add(DiagnosticsProperty('document', document))
      ..add(DiagnosticsProperty('action', action))
      ..add(DiagnosticsProperty('failure', failure))
      ..add(DiagnosticsProperty('saved', saved));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            (identical(other.document, document) ||
                other.document == document) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.saved, saved) || other.saved == saved));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, document, action, failure, saved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)
        initial,
    required TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)
        edit,
    required TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)
        loaded,
  }) {
    return loaded(document, action, failure, saved);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        initial,
    TResult? Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        edit,
    TResult? Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        loaded,
  }) {
    return loaded?.call(document, action, failure, saved);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        initial,
    TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        edit,
    TResult Function(Document document, SingleDocAction action,
            SingleDocFailure failure, bool saved)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(document, action, failure, saved);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements SingleDocState {
  const factory _Loaded(
      {required final Document document,
      required final SingleDocAction action,
      required final SingleDocFailure failure,
      required final bool saved}) = _$_Loaded;

  @override
  Document get document;
  @override
  SingleDocAction get action;
  @override
  SingleDocFailure get failure;
  @override
  bool get saved;
  @override
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}
