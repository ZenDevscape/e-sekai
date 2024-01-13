import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

import '../../failures/files/files_failure.dart';

abstract class FilesFacade {
  Future<Either<FilesFailure, File>> pickFile(
    String? initialDirectory,
    FileType type,
    List<String> allowedExtensions,
    bool allowCompression,
    bool allowMultiple,
    dynamic Function(FilePickerStatus)? onFileLoading,
  );
}
