import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/failures/files/files_failure.dart';
import '../../../domain/repositories/files/files_facade.dart';

@LazySingleton(as: FilesFacade)
class FilesFacadeImpl implements FilesFacade {
  final FilePicker _picker;

  const FilesFacadeImpl(
    this._picker,
  );

  @override
  Future<Either<FilesFailure, File>> pickFile(
    String? initialDirectory,
    FileType type,
    List<String> allowedExtensions,
    bool allowCompression,
    bool allowMultiple,
    dynamic Function(FilePickerStatus)? onFileLoading,
  ) async {
    try {
      final FilePickerResult? pickedFiles = await _picker.pickFiles(
        initialDirectory: initialDirectory,
        type: type,
        allowedExtensions: allowedExtensions,
        onFileLoading: onFileLoading,
        allowCompression: allowCompression,
        allowMultiple: allowMultiple,
      );

      if (pickedFiles != null) {
        return right(File(pickedFiles.files.single.path!));
      } else {
        return left(const FilesFailure.cancelledByUser());
      }
    } catch (_) {
      return left(const FilesFailure.unexpected());
    }
  }
}
