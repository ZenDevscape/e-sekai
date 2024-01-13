import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/documents/document.dart';

part 'single_doc_state.freezed.dart';

enum SingleDocFailure {
  none,
  unableToLoad,
  unableToSave,
  unableToCheck,
  unableToDelete,
  deleted,
}

enum SingleDocAction {
  none,
  saving,
  checking,
  deleting,
}

@freezed
class SingleDocState with _$SingleDocState {
  const factory SingleDocState.initial({
    @Default(Document.empty()) Document document,
    @Default(SingleDocAction.none) SingleDocAction action,
    @Default(SingleDocFailure.none) SingleDocFailure failure,
    @Default(false) bool saved,
  }) = _Initial;

  const factory SingleDocState.edit({
    required Document document,
    required SingleDocAction action,
    required SingleDocFailure failure,
    required bool saved,
  }) = _Edit;

  const factory SingleDocState.loaded({
    required Document document,
    required SingleDocAction action,
    required SingleDocFailure failure,
    required bool saved,
  }) = _Loaded;
}
