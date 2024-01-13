import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/failures/images/images_failure.dart';
import '../../domain/repositories/images/images_facade.dart';
import '../../injection.dart';

part 'pick_multi_images.g.dart';

@riverpod
PickMultiImages pickMultiImagesUseCase(
  PickMultiImagesUseCaseRef ref,
) {
  return getIt<PickMultiImages>();
}

@lazySingleton
class PickMultiImages {
  final ImagesFacade _imagesFacade;

  PickMultiImages(
    this._imagesFacade,
  );

  Future<Either<ImagesFailure, List<XFile>>> call({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    return await _imagesFacade.pickMultiImage(
      maxWidth,
      maxHeight,
      imageQuality,
    );
  }
}
