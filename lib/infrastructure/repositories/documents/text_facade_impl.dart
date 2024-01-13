import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/failures/documents/text_failure.dart';
import '../../../domain/repositories/documents/text_facade.dart';
import '../../../injection.dart';

@LazySingleton(as: TextFacade)
class TextFacadeImpl implements TextFacade {
  final Uuid _uuid;

  const TextFacadeImpl(
    this._uuid,
  );

  @override
  Future<Either<TextFailure, String>> extractFromImages(
    List<XFile> images,
  ) async {
    try {
      final TextRecognizer textRecognizer = getIt<TextRecognizer>();

      final List<String> texts = await Future.wait(
        images.map((image) async {
          final inputImage = InputImage.fromFilePath(image.path);
          final recognizedText = await textRecognizer.processImage(inputImage);
          return recognizedText.text;
        }),
      );

      textRecognizer.close();
      return right(texts.join(' ').replaceAll(RegExp(r'\s+'), ' ').trim());
    } catch (e) {
      return left(const TextFailure.unableToExtract());
    }
  }

  @override
  Future<Either<TextFailure, String>> extractFromDigitalPDF(
    File file,
  ) async {
    try {
      final PdfDocument document = PdfDocument(
        inputBytes: file.readAsBytesSync(),
      );
      final String text = PdfTextExtractor(document).extractText();

      document.dispose();

      return right(text.replaceAll(RegExp(r'\s+'), ' ').trim());
    } catch (e) {
      return left(const TextFailure.unableToExtract());
    }
  }

  @override
  Future<Either<TextFailure, String>> extractFromScanPDF(
    File file,
  ) async {
    try {
      final Directory dir = await getTemporaryDirectory();

      final Stream<String> images = Printing.raster(
        await file.readAsBytes(),
        dpi: 300,
      ).asyncMap((page) async {
        final image = await page.toPng();
        final file = await File(
          '${dir.path}/pdf-image/${_uuid.v4()}.png',
        ).create(recursive: true);

        await file.writeAsBytes(
          image,
          flush: true,
        );

        return file.absolute.path;
      });

      final TextRecognizer textRecognizer = getIt<TextRecognizer>();

      final List<String> texts = await images.asyncMap((image) async {
        final inputImage = InputImage.fromFilePath(image);
        final recognizedText = await textRecognizer.processImage(inputImage);

        return recognizedText.text;
      }).toList();

      textRecognizer.close();
      return right(texts.join(' ').replaceAll(RegExp(r'\s+'), ' ').trim());
    } catch (e) {
      return left(const TextFailure.unableToExtract());
    }
  }
}
