import 'package:injectable/injectable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/auth/auth_facade.dart';
import '../../injection.dart';

part 'sign_out.g.dart';

@riverpod
SignOut signOutUseCase(SignOutUseCaseRef ref) {
  return getIt<SignOut>();
}

@lazySingleton
class SignOut {
  final AuthFacade _authFacade;

  SignOut(
    this._authFacade,
  );

  Future<void> call() async {
    return await _authFacade.signOut();
  }
}
