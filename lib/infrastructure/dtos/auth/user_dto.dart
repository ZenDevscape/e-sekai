import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../../domain/entities/auth/user.dart';

class UserDto {
  static User? fromFirebaseUser(firebase_auth.User? user) {
    return user != null
        ? User(
            id: user.uid,
            name: user.displayName ?? '',
            emailAddress: user.email ?? '',
            photoUrl: user.photoURL ?? '',
          )
        : null;
  }
}
