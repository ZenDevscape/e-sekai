import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/auth/user.dart';
import '../../domain/repositories/auth/auth_facade.dart';
import '../../injection.dart';

part 'watch_user.g.dart';

@riverpod
WatchUser watchUserUseCase(WatchUserUseCaseRef ref) {
  return getIt<WatchUser>();
}

@lazySingleton
class WatchUser {
  final AuthFacade _authFacade;

  WatchUser(
    this._authFacade,
  );

  Stream<Option<User>> call() {
    return _authFacade.watchSignedInUser();
  }
}
