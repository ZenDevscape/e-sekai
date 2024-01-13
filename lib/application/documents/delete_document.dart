import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/documents/document.dart';
import '../../domain/failures/documents/document_failure.dart';
import '../../domain/repositories/auth/auth_facade.dart';
import '../../domain/repositories/documents/documents_repository.dart';
import '../../injection.dart';

part 'delete_document.g.dart';

@riverpod
DeleteDocument deleteDocumentUseCase(DeleteDocumentUseCaseRef ref) {
  return getIt<DeleteDocument>();
}

@lazySingleton
class DeleteDocument {
  final DocumentsRepository _documentsRepository;
  final AuthFacade _authFacade;

  DeleteDocument(
    this._documentsRepository,
    this._authFacade,
  );

  Future<Either<DocumentFailure, Unit>> call(
    Document document,
  ) async {
    final userOrNull = await _authFacade.getSignedInUser();

    return userOrNull.fold(
      () {
        return left(const DocumentFailure.unauthenticated());
      },
      (user) async {
        return await _documentsRepository.deleteDocument(
          user.id,
          document,
        );
      },
    );
  }
}
