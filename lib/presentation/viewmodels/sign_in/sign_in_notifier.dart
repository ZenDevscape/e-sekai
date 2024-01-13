import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/auth/sign_in.dart';
import '../../../domain/entities/auth/signin_details.dart';
import 'sign_in_state.dart';

part 'sign_in_notifier.g.dart';

@riverpod
class SignInNotifier extends _$SignInNotifier {
  @override
  SignInState build() {
    return const SignInState.initial();
  }

  Future<void> signInWithGoogle() async {
    final signInUseCase = ref.read(signInUseCaseProvider);

    state = const SignInState.loading();

    final unitOrFailure = await signInUseCase(const SignInDetails.google());

    unitOrFailure.fold(
      (failure) {
        return state = const SignInState.failed();
      },
      (_) {
        return state = const SignInState.loaded();
      },
    );
  }

  Future<void> signInWithMicrosoft() async {
    final signInUseCase = ref.read(signInUseCaseProvider);

    state = const SignInState.loading();

    final unitOrFailure = await signInUseCase(const SignInDetails.microsoft());

    unitOrFailure.fold(
      (failure) {
        return state = const SignInState.failed();
      },
      (_) {
        return state = const SignInState.loaded();
      },
    );
  }
}
