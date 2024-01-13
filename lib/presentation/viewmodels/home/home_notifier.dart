import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/documents/delete_document.dart';
import '../../../application/documents/get_documents.dart';
import '../../../domain/entities/documents/document.dart';
import 'home_state.dart';

part 'home_notifier.g.dart';

@Riverpod(keepAlive: true)
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    return const HomeState.loading();
  }

  Future<void> getDocs() async {
    final getDocumentsUseCase = ref.read(getDocumentsUseCaseProvider);

    state = const HomeState.loading();

    final documentsOrFailure = await getDocumentsUseCase();

    documentsOrFailure.fold(
      (failure) {
        state = const HomeState.failedToLoadData();
      },
      (docs) {
        state = HomeState.loaded(documents: docs);
      },
    );
  }

  Future<void> deleteDoc(
    Document document,
  ) async {
    final deleteDocumentUseCase = ref.read(deleteDocumentUseCaseProvider);

    final voidOrFailure = await deleteDocumentUseCase(document);

    voidOrFailure.fold(
      (failure) => null,
      (_) {
        getDocs();
      },
    );
  }
}
