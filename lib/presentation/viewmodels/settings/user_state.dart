import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/auth/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.loading({
    User? user,
  }) = _Loading;
  const factory UserState.loaded({
    required User user,
  }) = _Loaded;
  const factory UserState.unauthenticated({
    User? user,
  }) = _Unauthenticated;
}
