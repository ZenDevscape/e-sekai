import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/documents/document.dart';
import '../../../domain/failures/documents/document_failure.dart';
import '../../../domain/repositories/documents/documents_repository.dart';
import '../../dtos/documents/dcoument_dto.dart';

@LazySingleton(as: DocumentsRepository)
class FirebaseDocumentsRepositoryImpl implements DocumentsRepository {
  final FirebaseDatabase _firebaseDb;

  const FirebaseDocumentsRepositoryImpl(
    this._firebaseDb,
  );

  DatabaseReference _documentsRef(String userId) {
    return _firebaseDb.ref('documents/$userId');
  }

  @override
  Future<Either<DocumentFailure, Unit>> createDocument(
    String userId,
    Document document,
  ) async {
    try {
      _documentsRef(userId).child(document.id).set(
            DocumentDto.toJson(document),
          );

      return right(unit);
    } catch (_) {
      return left(const DocumentFailure.unexpected());
    }
  }

  @override
  Future<Either<DocumentFailure, Unit>> updateDocument(
    String userId,
    Document document,
  ) async {
    try {
      _documentsRef(userId).update({
        document.id: DocumentDto.toJson(document),
      });

      return right(unit);
    } catch (_) {
      return left(const DocumentFailure.unableToUpdate());
    }
  }

  @override
  Future<Either<DocumentFailure, Unit>> deleteDocument(
    String userId,
    Document document,
  ) async {
    try {
      await _documentsRef(userId).child(document.id).remove();

      return right(unit);
    } catch (_) {
      return left(const DocumentFailure.unexpected());
    }
  }

  @override
  Future<Either<DocumentFailure, Document>> readDocument(
    String userId,
    String documentId,
  ) async {
    try {
      final DataSnapshot dataSnapshot =
          await _documentsRef(userId).child(documentId).get();

      if (dataSnapshot.value == null) {
        return left(const DocumentFailure.unexpected());
      }

      final Document document = DocumentDto.fromJson(
        documentId,
        dataSnapshot.value! as Map<Object?, Object?>,
      );

      return right(document);
    } catch (_) {
      return left(const DocumentFailure.unexpected());
    }
  }

  @override
  Future<Either<DocumentFailure, List<Document>>> readAllDocument(
    String userId,
  ) async {
    try {
      final DataSnapshot dataSnapshot = await _documentsRef(userId).get();

      final Map<Object?, Object?> data =
          dataSnapshot.value as Map<Object?, Object?>? ?? {};

      final List<Document> documents = data.entries.map((document) {
        return DocumentDto.fromJson(
          document.key as String,
          Map<String, dynamic>.from(document.value as Map<Object?, Object?>),
        );
      }).toList();

      return right(documents);
    } catch (_) {
      return left(const DocumentFailure.unexpected());
    }
  }
}
