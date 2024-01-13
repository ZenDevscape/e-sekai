import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/files/pick_file.dart';
import 'add_file_state.dart';

part 'add_file_notifier.g.dart';

@Riverpod(keepAlive: true)
class AddFileNotifier extends _$AddFileNotifier {
  @override
  AddFileState build() {
    return const AddFileState.initial();
  }

  Future<void> pickFile() async {
    final pickFileUseCase = ref.read(pickFileUseCaseProvider);

    state = const AddFileState.initial();

    final imagesOrFailure = await pickFileUseCase();

    imagesOrFailure.fold(
      (failure) {
        failure.whenOrNull(
          unexpected: () => state = const AddFileState.failed(),
        );
      },
      (file) {
        state = AddFileState.loaded(
          file: file,
        );
      },
    );
  }

  void clearFile() {
    state = const AddFileState.initial();
  }
}
