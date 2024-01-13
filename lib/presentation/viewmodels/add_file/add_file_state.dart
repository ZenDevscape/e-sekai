import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_file_state.freezed.dart';

@freezed
class AddFileState with _$AddFileState {
  const factory AddFileState.initial() = _Initial;

  const factory AddFileState.loaded({
    required File file,
  }) = _Loaded;

  const factory AddFileState.failed() = _Failed;
}
