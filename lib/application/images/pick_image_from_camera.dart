import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/failures/images/images_failure.dart';
import '../../domain/repositories/images/images_facade.dart';
import '../../injection.dart';

part 'pick_image_from_camera.g.dart';

@riverpod
PickImageFromCamera pickImageFromCameraUseCase(
  PickImageFromCameraUseCaseRef ref,
) {
  return getIt<PickImageFromCamera>();
}

@lazySingleton
class PickImageFromCamera {
  final ImagesFacade _imagesFacade;

  PickImageFromCamera(
    this._imagesFacade,
  );

  Future<Either<ImagesFailure, XFile>> call({
    CameraDevice preferredCameraDevice = CameraDevice.rear,
    bool requestFullMetadata = true,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    return await _imagesFacade.pickImageFromCamera(
      preferredCameraDevice,
      requestFullMetadata,
      maxWidth,
      maxHeight,
      imageQuality,
    );
  }
}
