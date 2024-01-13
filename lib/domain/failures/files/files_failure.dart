import 'package:freezed_annotation/freezed_annotation.dart';

part 'files_failure.freezed.dart';

@freezed
class FilesFailure with _$FilesFailure {
  const factory FilesFailure.cancelledByUser() = _CancelledByUser;

  const factory FilesFailure.unexpected() = _Unexpected;
}
