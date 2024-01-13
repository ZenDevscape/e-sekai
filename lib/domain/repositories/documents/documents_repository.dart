import 'package:dartz/dartz.dart';

import '../../entities/documents/document.dart';
import '../../failures/documents/document_failure.dart';

abstract class DocumentsRepository {
  Future<Either<DocumentFailure, Unit>> createDocument(
    String userId,
    Document document,
  );

  Future<Either<DocumentFailure, Unit>> updateDocument(
    String userId,
    Document document,
  );

  Future<Either<DocumentFailure, Unit>> deleteDocument(
    String userId,
    Document document,
  );

  Future<Either<DocumentFailure, Document>> readDocument(
    String userId,
    String documentId,
  );

  Future<Either<DocumentFailure, List<Document>>> readAllDocument(
    String userId,
  );
}
