import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/auth/sign_out.dart';
import '../../../application/auth/watch_user.dart';
import 'user_state.dart';

part 'user_notifier.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  UserState build() {
    final watchUserUseCase = ref.read(watchUserUseCaseProvider);

    final streamUserOrNull = watchUserUseCase();

    final subUserOrNull = streamUserOrNull.listen((userOrNull) {
      userOrNull.fold(
        () {
          return state = const UserState.unauthenticated();
        },
        (user) {
          return state = UserState.loaded(user: user);
        },
      );
    });

    ref.onDispose(() {
      subUserOrNull.cancel();
    });

    return const UserState.loading();
  }

  Future<void> signOut() async {
    final signOutUseCase = ref.read(signOutUseCaseProvider);

    await signOutUseCase();
  }
}
