import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/failures/documents/text_failure.dart';
import '../../domain/repositories/documents/text_facade.dart';
import '../../injection.dart';

part 'extract_text_from_images.g.dart';

@riverpod
ExtractTextFromImages extractTextFromImagesUseCase(
  ExtractTextFromImagesUseCaseRef ref,
) {
  return getIt<ExtractTextFromImages>();
}

@lazySingleton
class ExtractTextFromImages {
  final TextFacade _textFacade;

  ExtractTextFromImages(
    this._textFacade,
  );

  Future<Either<TextFailure, String>> call(
    List<XFile> images,
  ) async {
    return await _textFacade.extractFromImages(
      images,
    );
  }
}
