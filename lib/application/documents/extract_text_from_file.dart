import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/failures/documents/text_failure.dart';
import '../../domain/repositories/documents/text_facade.dart';
import '../../injection.dart';

part 'extract_text_from_file.g.dart';

@riverpod
ExtractTextFromFile extractTextFromFileUseCase(
  ExtractTextFromFileUseCaseRef ref,
) {
  return getIt<ExtractTextFromFile>();
}

@lazySingleton
class ExtractTextFromFile {
  final TextFacade _textFacade;

  ExtractTextFromFile(
    this._textFacade,
  );

  Future<Either<TextFailure, String>> call(
    File file,
  ) async {
    switch (file.path.split('.').last.toLowerCase()) {
      case 'pdf':
        final digitalExtractTextOrFailure =
            await _textFacade.extractFromDigitalPDF(
          file,
        );

        return digitalExtractTextOrFailure.fold(
          (failure) => left(failure),
          (text) async {
            if (text.isNotEmpty && text.length > 10) {
              return right(text);
            } else {
              return await _textFacade.extractFromScanPDF(
                file,
              );
            }
          },
        );
      default:
        return left(const TextFailure.unexpected());
    }
  }
}
