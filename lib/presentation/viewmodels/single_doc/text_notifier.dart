import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/documents/extract_text_from_file.dart';
import '../../../application/documents/extract_text_from_images.dart';

part 'text_notifier.g.dart';

@Riverpod(keepAlive: true)
class TextNotifier extends _$TextNotifier {
  @override
  String build() {
    return '';
  }

  Future<void> extractTextFromImages(
    List<XFile> images,
  ) async {
    final extractTextFromImagesUseCase =
        ref.read(extractTextFromImagesUseCaseProvider);

    final textOrFailure = await extractTextFromImagesUseCase(images);

    textOrFailure.fold(
      (failure) {
        failure.when(
          unableToExtract: () {
            state = 'Unable to extract text from images';
          },
          unexpected: () {
            state = 'Unexpected error occured';
          },
        );
      },
      (text) {
        state = text;
      },
    );
  }

  Future<void> extractTextFromFile(
    File file,
  ) async {
    final extractTextFromFileUseCase =
        ref.read(extractTextFromFileUseCaseProvider);

    final textOrFailure = await extractTextFromFileUseCase(file);

    textOrFailure.fold(
      (failure) {
        failure.when(
          unableToExtract: () {
            state = 'Unable to extract text from file';
          },
          unexpected: () {
            state = 'Unexpected error occured';
          },
        );
      },
      (text) {
        state = text;
      },
    );
  }
}
