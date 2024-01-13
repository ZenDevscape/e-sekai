import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../failures/documents/text_failure.dart';

abstract class TextFacade {
  Future<Either<TextFailure, String>> extractFromImages(
    List<XFile> images,
  );

  Future<Either<TextFailure, String>> extractFromDigitalPDF(
    File file,
  );

  Future<Either<TextFailure, String>> extractFromScanPDF(
    File file,
  );
}
