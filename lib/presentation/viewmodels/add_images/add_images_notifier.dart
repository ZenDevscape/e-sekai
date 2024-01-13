import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/images/pick_image_from_camera.dart';
import '../../../application/images/pick_multi_images.dart';
import '../../../application/images/retrieve_lost_images.dart';
import 'add_images_state.dart';

part 'add_images_notifier.g.dart';

@Riverpod(keepAlive: true)
class AddImagesNotifier extends _$AddImagesNotifier {
  @override
  AddImagesState build() {
    return const AddImagesState.initial();
  }

  Future<void> pickMultiImages() async {
    final pickMultiImagesUseCase = ref.read(pickMultiImagesUseCaseProvider);

    state = AddImagesState.initial(
      images: state.images,
    );

    final imagesOrFailure = await pickMultiImagesUseCase();

    imagesOrFailure.fold(
      (failure) {
        failure.whenOrNull(
          unexpected: () {
            state = AddImagesState.failed(
              images: state.images,
            );
          },
        );
      },
      (images) {
        state = AddImagesState.loaded(
          images: state.images + images,
        );
      },
    );
  }

  Future<void> pickImageFromCamera() async {
    final pickImageFromCameraUseCase =
        ref.read(pickImageFromCameraUseCaseProvider);

    state = AddImagesState.initial(
      images: state.images,
    );

    final imageOrFailure = await pickImageFromCameraUseCase();

    imageOrFailure.fold(
      (failure) {
        failure.whenOrNull(
          unexpected: () {
            state = AddImagesState.failed(
              images: state.images,
            );
          },
        );
      },
      (image) {
        state = AddImagesState.loaded(
          images: state.images + [image],
        );
      },
    );
  }

  Future<void> retrieveLostData() async {
    final retrieveLostImagesUseCase =
        ref.read(retrieveLostImagesUseCaseProvider);

    final imagesOrFailure = await retrieveLostImagesUseCase();

    imagesOrFailure.fold(
      (failure) {
        failure.whenOrNull(
          unexpected: () {
            state = AddImagesState.failed(
              images: state.images,
            );
          },
        );
      },
      (images) {
        state = AddImagesState.loaded(
          images: state.images + images,
        );
      },
    );
  }

  void reorderImages(int oldIndex, int newIndex) async {
    final List<XFile> images = List.from(state.images);
    final XFile image = images.removeAt(oldIndex);
    images.insert(newIndex, image);

    state = AddImagesState.loaded(
      images: images,
    );
  }

  void removeImage(int index) async {
    final List<XFile> images = List.from(state.images);
    images.removeAt(index);

    state = AddImagesState.loaded(
      images: images,
    );
  }

  void clearImages() {
    state = const AddImagesState.initial();
  }
}
