import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:esekai/injection.dart';

import '../../../application/documents/add_document.dart';
import '../../../application/documents/check_document.dart';
import '../../../application/documents/delete_document.dart';
import '../../../application/documents/get_document.dart';
import '../../../application/documents/update_document.dart';
import '../../../domain/entities/documents/document.dart';
import 'single_doc_state.dart';

part 'single_doc_notifier.g.dart';

@Riverpod(keepAlive: true)
class SingleDocNotifier extends _$SingleDocNotifier {
  @override
  SingleDocState build() {
    return const SingleDocState.initial();
  }

  void switchToEdit() {
    state = SingleDocState.edit(
      document: state.document,
      action: SingleDocAction.none,
      failure: SingleDocFailure.none,
      saved: state.saved,
    );
  }

  void insertDoc(String title, String text) {
    state = state.copyWith(
      document: state.document.copyWith(
        title: title.trim(),
        text: text.trim(),
      ),
    );
  }

  void initializeDoc(String? initialDocText) {
    state = SingleDocState.edit(
      document: Document(
        id: getIt<Uuid>().v4(),
        title: DateFormat('dd-MM-yyyy HH-mm-ss').format(DateTime.now()),
        text: initialDocText ?? '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      action: SingleDocAction.none,
      failure: SingleDocFailure.none,
      saved: false,
    );
  }

  Future<void> addDoc() async {
    final addDocumentUseCase = ref.read(addDocumentUseCaseProvider);

    state = state.copyWith(
      action: SingleDocAction.saving,
      failure: SingleDocFailure.none,
    );

    final document = state.document.copyWith(
      updatedAt: DateTime.now(),
    );

    final voidOrFailure = await addDocumentUseCase(
      document,
    );

    voidOrFailure.fold(
      (failure) {
        state = state.copyWith(
          action: SingleDocAction.none,
          failure: SingleDocFailure.unableToSave,
        );
      },
      (_) {
        state = SingleDocState.loaded(
          document: document,
          action: SingleDocAction.none,
          failure: SingleDocFailure.none,
          saved: true,
        );
      },
    );
  }

  Future<void> getDoc(
    String documentId,
  ) async {
    final getDocumentUseCase = ref.read(getDocumentUseCaseProvider);

    state = const SingleDocState.initial();

    final documentsOrFailure = await getDocumentUseCase(
      documentId,
    );

    documentsOrFailure.fold(
      (failure) {
        state = state.copyWith(
          failure: SingleDocFailure.unableToLoad,
        );
      },
      (doc) {
        state = SingleDocState.loaded(
          document: doc,
          action: SingleDocAction.none,
          failure: SingleDocFailure.none,
          saved: true,
        );
      },
    );
  }

  Future<void> updateDoc() async {
    final updateDocumentUseCase = ref.read(updateDocumentUseCaseProvider);

    state = state.copyWith(
      action: SingleDocAction.saving,
      failure: SingleDocFailure.none,
    );

    final document = state.document.copyWith(
      updatedAt: DateTime.now(),
    );

    final voidOrFailure = await updateDocumentUseCase(
      document,
    );

    voidOrFailure.fold(
      (failure) {
        state = state.copyWith(
          action: SingleDocAction.none,
          failure: SingleDocFailure.unableToSave,
        );
      },
      (_) {
        state = SingleDocState.loaded(
          document: document,
          action: SingleDocAction.none,
          failure: SingleDocFailure.none,
          saved: true,
        );
      },
    );
  }

  Future<void> deleteDoc() async {
    final deleteDocumentUseCase = ref.read(deleteDocumentUseCaseProvider);

    state = state.copyWith(
      action: SingleDocAction.deleting,
      failure: SingleDocFailure.none,
    );

    final voidOrFailure = await deleteDocumentUseCase(state.document);

    voidOrFailure.fold(
      (failure) {
        state = state.copyWith(
          action: SingleDocAction.none,
          failure: SingleDocFailure.unableToDelete,
        );
      },
      (_) {
        state = state.copyWith(
          document: state.document,
          action: SingleDocAction.none,
          failure: SingleDocFailure.deleted,
          saved: state.saved,
        );
      },
    );
  }

  Future<void> checkDoc() async {
    final checkDocumentUseCase = ref.read(checkDocumentUseCaseProvider);

    state = state.copyWith(
      action: SingleDocAction.checking,
      failure: SingleDocFailure.none,
    );

    final checkResultOrFailure =
        await checkDocumentUseCase(state.document.text);

    checkResultOrFailure.fold(
      (failure) {
        state = state.copyWith(
          action: SingleDocAction.none,
          failure: SingleDocFailure.unableToCheck,
        );
      },
      (checkResult) {
        state = state.copyWith(
          document: state.document.copyWith(
            checkResult: checkResult,
            lastCheckedAt: DateTime.now(),
          ),
          action: SingleDocAction.none,
          failure: SingleDocFailure.none,
          saved: state.saved,
        );

        if (state.saved) {
          updateDoc();
        } else {
          addDoc();
        }
      },
    );
  }
}
