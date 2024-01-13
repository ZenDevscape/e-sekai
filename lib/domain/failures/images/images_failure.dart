import 'package:freezed_annotation/freezed_annotation.dart';

part 'images_failure.freezed.dart';

@freezed
class ImagesFailure with _$ImagesFailure {
  const factory ImagesFailure.cancelledByUser() = _CancelledByUser;

  const factory ImagesFailure.unexpected() = _Unexpected;
}
