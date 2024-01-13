import 'dart:io';

import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../viewmodels/add_images/add_images_notifier.dart';
import '../../viewmodels/add_images/add_images_state.dart';
import '../../viewmodels/add_images/lightbox_notifier.dart';

class Lightbox extends ConsumerStatefulWidget {
  final int initialIndex;
  final BoxDecoration? backgroundDecoration;
  final LoadingBuilder? loadingBuilder;

  const Lightbox({
    super.key,
    this.initialIndex = 0,
    this.backgroundDecoration,
    this.loadingBuilder,
  });

  @override
  ConsumerState<Lightbox> createState() => _LightboxState();
}

class _LightboxState extends ConsumerState<Lightbox> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: widget.initialIndex,
    );

    Future.delayed(
      Duration.zero,
      () {
        ref.read(lightboxNotifierProvider.notifier).setIndex(
              widget.initialIndex,
            );
      },
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final AddImagesState state = ref.watch(addImagesNotifierProvider);
    final int stateIndex = ref.watch(lightboxNotifierProvider);

    return DismissiblePage(
      direction: DismissiblePageDismissDirection.vertical,
      startingOpacity: 0.7,
      onDismissed: () {
        Navigator.of(context).pop();
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PhotoViewGallery.builder(
            itemCount: state.images.length,
            pageController: _pageController,
            scrollPhysics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            backgroundDecoration: widget.backgroundDecoration ??
                BoxDecoration(
                  color: Theme.of(context).canvasColor,
                ),
            onPageChanged: (index) {
              ref.read(lightboxNotifierProvider.notifier).setIndex(index);
            },
            loadingBuilder: widget.loadingBuilder,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                initialScale: PhotoViewComputedScale.contained,
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 1.5,
                imageProvider: FileImage(
                  File(state.images[index].path),
                ),
                heroAttributes: PhotoViewHeroAttributes(
                  tag: state.images[index].path,
                ),
              );
            },
          ),
          Container(
            width: double.infinity,
            height: 80,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: widget.backgroundDecoration?.color?.withOpacity(0.9) ??
                  Theme.of(context).canvasColor.withOpacity(0.9),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: TextButton(
                      onPressed: stateIndex > 0
                          ? () {
                              ref
                                  .read(addImagesNotifierProvider.notifier)
                                  .reorderImages(
                                    stateIndex,
                                    stateIndex - 1,
                                  );
                              Future.delayed(
                                Duration.zero,
                                () {
                                  _pageController.jumpToPage(stateIndex - 1);
                                },
                              );
                            }
                          : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.keyboard_double_arrow_left),
                          Text('Move Left'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: TextButton(
                      onPressed: stateIndex < state.images.length - 1
                          ? () {
                              ref
                                  .read(addImagesNotifierProvider.notifier)
                                  .reorderImages(
                                    stateIndex,
                                    stateIndex + 1,
                                  );
                              Future.delayed(
                                Duration.zero,
                                () {
                                  _pageController.jumpToPage(stateIndex + 1);
                                },
                              );
                            }
                          : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.keyboard_double_arrow_right),
                          Text('Move Right'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        if (state.images.length == 1) {
                          Navigator.of(context).pop();
                        } else if (state.images.length == stateIndex + 1) {
                          _pageController.jumpToPage(stateIndex - 1);
                        }

                        ref
                            .read(addImagesNotifierProvider.notifier)
                            .removeImage(stateIndex);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.delete),
                          Text('Remove'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
