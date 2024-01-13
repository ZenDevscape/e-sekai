import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/auth/signin_details.dart';
import '../../domain/failures/auth/auth_failure.dart';
import '../../domain/repositories/auth/auth_facade.dart';
import '../../injection.dart';

part 'sign_in.g.dart';

@riverpod
SignIn signInUseCase(SignInUseCaseRef ref) {
  return getIt<SignIn>();
}

@lazySingleton
class SignIn {
  final AuthFacade _authFacade;

  SignIn(
    this._authFacade,
  );

  Future<Either<AuthFailure, Unit>> call(SignInDetails details) async {
    return details.when(
      google: () {
        return _authFacade.signInWithGoogle();
      },
      microsoft: () {
        return _authFacade.signInWithMicrosoft();
      },
    );
  }
}
