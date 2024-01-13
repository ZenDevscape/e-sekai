import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_failure.freezed.dart';

@freezed
class TextFailure with _$TextFailure {
  const factory TextFailure.unexpected() = _Unexpected;

  const factory TextFailure.unableToExtract() = _UnableToExtract;
}
