import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lightbox_notifier.g.dart';

@Riverpod(keepAlive: true)
class LightboxNotifier extends _$LightboxNotifier {
  @override
  int build() {
    return 0;
  }

  void setIndex(
    int index,
  ) {
    state = index;
  }
}
