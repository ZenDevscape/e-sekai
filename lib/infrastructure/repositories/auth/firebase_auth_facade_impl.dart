import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/auth/user.dart';
import '../../../domain/failures/auth/auth_failure.dart';
import '../../../domain/repositories/auth/auth_facade.dart';
import '../../dtos/auth/user_dto.dart';

@LazySingleton(as: AuthFacade)
class FirebaseAuthFacadeImpl implements AuthFacade {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final firebase_auth.MicrosoftAuthProvider _microsoftAuthProvider;

  const FirebaseAuthFacadeImpl(
    this._firebaseAuth,
    this._googleSignIn,
    this._microsoftAuthProvider,
  );

  @override
  Future<Option<User>> getSignedInUser() async {
    final firebase_auth.User? user = _firebaseAuth.currentUser;

    return optionOf(UserDto.fromFirebaseUser(user));
  }

  @override
  Stream<Option<User>> watchSignedInUser() {
    final Stream<firebase_auth.User?> user = _firebaseAuth.authStateChanges();

    return user.map((user) => optionOf(UserDto.fromFirebaseUser(user)));
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final firebase_auth.OAuthCredential authCredential =
          firebase_auth.GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      await _firebaseAuth.signInWithCredential(authCredential);

      return right(unit);
    } catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithMicrosoft() async {
    try {
      await _firebaseAuth.signInWithProvider(_microsoftAuthProvider);

      return right(unit);
    } catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
