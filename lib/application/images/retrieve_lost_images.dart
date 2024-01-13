import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/failures/images/images_failure.dart';
import '../../domain/repositories/images/images_facade.dart';
import '../../injection.dart';

part 'retrieve_lost_images.g.dart';

@riverpod
RetrieveLostImages retrieveLostImagesUseCase(RetrieveLostImagesUseCaseRef ref) {
  return getIt<RetrieveLostImages>();
}

@lazySingleton
class RetrieveLostImages {
  final ImagesFacade _imagesFacade;

  RetrieveLostImages(
    this._imagesFacade,
  );

  Future<Either<ImagesFailure, List<XFile>>> call({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    return await _imagesFacade.retrieveLostImages();
  }
}
