import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_failure.freezed.dart';

@freezed
class CheckFailure with _$CheckFailure {
  const factory CheckFailure.unexpected() = _Unexpected;

  const factory CheckFailure.unauthenticated() = _Unauthenticated;
}
