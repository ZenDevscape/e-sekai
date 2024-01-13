import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../failures/images/images_failure.dart';

abstract class ImagesFacade {
  Future<Either<ImagesFailure, List<XFile>>> pickMultiImage(
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  );

  Future<Either<ImagesFailure, XFile>> pickImageFromCamera(
    CameraDevice preferredCameraDevice,
    bool requestFullMetadata,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  );

  Future<Either<ImagesFailure, List<XFile>>> retrieveLostImages();
}
