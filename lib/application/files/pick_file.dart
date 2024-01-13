import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/failures/files/files_failure.dart';
import '../../domain/repositories/files/files_facade.dart';
import '../../injection.dart';

part 'pick_file.g.dart';

@riverpod
PickFile pickFileUseCase(PickFileUseCaseRef ref) {
  return getIt<PickFile>();
}

@lazySingleton
class PickFile {
  final FilesFacade _filesFacade;

  PickFile(
    this._filesFacade,
  );

  Future<Either<FilesFailure, File>> call({
    String? initialDirectory,
    FileType type = FileType.custom,
    List<String> allowedExtensions = const ['pdf'],
    bool allowCompression = true,
    bool allowMultiple = false,
    dynamic Function(FilePickerStatus)? onFileLoading,
  }) async {
    return await _filesFacade.pickFile(
      initialDirectory,
      type,
      allowedExtensions,
      allowCompression,
      allowMultiple,
      onFileLoading,
    );
  }
}
