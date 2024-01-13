import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_failure.freezed.dart';

@freezed
class DocumentFailure with _$DocumentFailure {
  const factory DocumentFailure.unexpected() = _Unexpected;

  const factory DocumentFailure.unauthenticated() = _Unauthenticated;

  const factory DocumentFailure.unableToUpdate() = _UnableToUpdate;
}
