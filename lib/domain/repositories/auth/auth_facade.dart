import 'package:dartz/dartz.dart';

import '../../entities/auth/user.dart';
import '../../failures/auth/auth_failure.dart';

abstract class AuthFacade {
  Future<Option<User>> getSignedInUser();

  Stream<Option<User>> watchSignedInUser();

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<Either<AuthFailure, Unit>> signInWithMicrosoft();

  Future<void> signOut();
}
