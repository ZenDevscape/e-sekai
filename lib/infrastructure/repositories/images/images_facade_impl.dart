import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/failures/images/images_failure.dart';
import '../../../domain/repositories/images/images_facade.dart';

@LazySingleton(as: ImagesFacade)
class ImagesFacadeImpl implements ImagesFacade {
  final ImagePicker _picker;

  const ImagesFacadeImpl(
    this._picker,
  );

  @override
  Future<Either<ImagesFailure, List<XFile>>> pickMultiImage(
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  ) async {
    try {
      final List<XFile> pickedFiles = await _picker.pickMultiImage(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
      );

      return right(pickedFiles);
    } catch (_) {
      return left(const ImagesFailure.unexpected());
    }
  }

  @override
  Future<Either<ImagesFailure, XFile>> pickImageFromCamera(
    CameraDevice preferredCameraDevice,
    bool requestFullMetadata,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  ) async {
    try {
      final XFile? pickedFiles = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: preferredCameraDevice,
        requestFullMetadata: requestFullMetadata,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
      );

      if (pickedFiles != null) {
        return right(pickedFiles);
      } else {
        return left(const ImagesFailure.cancelledByUser());
      }
    } catch (_) {
      return left(const ImagesFailure.unexpected());
    }
  }

  @override
  Future<Either<ImagesFailure, List<XFile>>> retrieveLostImages() async {
    final LostDataResponse response = await _picker.retrieveLostData();

    if (response.isEmpty) {
      return right([]);
    } else if (response.type == RetrieveType.image) {
      if (response.files != null) {
        return right(response.files!);
      } else {
        return right([response.file!]);
      }
    } else {
      return left(const ImagesFailure.unexpected());
    }
  }
}
