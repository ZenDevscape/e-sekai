import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'add_images_state.freezed.dart';

@freezed
class AddImagesState with _$AddImagesState {
  const factory AddImagesState.initial({
    @Default([]) List<XFile> images,
  }) = _Initial;

  const factory AddImagesState.loaded({
    required List<XFile> images,
  }) = _Loaded;

  const factory AddImagesState.failed({
    required List<XFile> images,
  }) = _Failed;
}
