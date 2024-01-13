import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:esekai/presentation/viewmodels/single_doc/text_notifier.dart';

import '../../../injection.dart';
import '../../viewmodels/add_images/add_images_notifier.dart';
import '../../viewmodels/add_images/add_images_state.dart';
import '../../widgets/add_images/lightbox.dart';

class AddImagesPage extends ConsumerStatefulWidget {
  const AddImagesPage({
    super.key,
  });

  @override
  ConsumerState<AddImagesPage> createState() => _AddImagesPageState();
}

class _AddImagesPageState extends ConsumerState<AddImagesPage> {
  @override
  void initState() {
    super.initState();

    ref.read(addImagesNotifierProvider.notifier).retrieveLostData();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final AddImagesState state = ref.watch(addImagesNotifierProvider);

    ref.listen(
      addImagesNotifierProvider,
      (previousState, nextState) {
        nextState.whenOrNull(
          failed: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to add images'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        );
      },
    );

    return WillPopScope(
      onWillPop: () async {
        bool willPop = false;

        final images = ref.read(addImagesNotifierProvider).images;

        if (images.isNotEmpty) {
          await showDialog<void>(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text('Confirm Cancel'),
                content: const Text('Are you sure want to cancel?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('No'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      willPop = true;

                      ref
                          .read(addImagesNotifierProvider.notifier)
                          .clearImages();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Yes'),
                  ),
                ],
              );
            },
          );
        } else {
          willPop = true;
        }

        return willPop;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Add from Images',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: state.images.isNotEmpty
              ? [
                  IconButton(
                    onPressed: () async {
                      await ref
                          .read(textNotifierProvider.notifier)
                          .extractTextFromImages(state.images);
                      ref
                          .read(addImagesNotifierProvider.notifier)
                          .clearImages();

                      final String text = ref.read(textNotifierProvider);

                      if (context.mounted) {
                        context.pushReplacement(Uri(
                          path: '/doc/new',
                          queryParameters: {
                            'initial_text': text,
                          },
                        ).toString());
                      }
                    },
                    icon: const Icon(
                      Icons.check_rounded,
                    ),
                  ),
                ]
              : null,
        ),
        body: ReorderableBuilder(
          enableDraggable: true,
          onReorder: (List<OrderUpdateEntity> orderUpdateEntities) {
            orderUpdateEntities.forEach(
              (e) {
                ref.read(addImagesNotifierProvider.notifier).reorderImages(
                      e.oldIndex,
                      e.newIndex,
                    );
              },
            );
          },
          builder: (
            List<Widget> children,
          ) {
            return GridView(
              key: getIt<GlobalKey>(instanceName: 'addImagesGridVewKey'),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              children: children,
            );
          },
          children: List.generate(
            state.images.length,
            (i) {
              return InkWell(
                key: ValueKey(state.images[i].path),
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder<void>(
                      opaque: false,
                      pageBuilder: (_, __, ___) {
                        return Lightbox(
                          initialIndex: i,
                        );
                      },
                    ),
                  );
                },
                child: Hero(
                  tag: state.images[i].path,
                  child: Image.file(
                    File(state.images[i].path),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: SpeedDial(
          elevation: 0,
          spacing: 3,
          spaceBetweenChildren: 2,
          icon: Icons.add_rounded,
          activeIcon: Icons.close_rounded,
          renderOverlay: true,
          children: <SpeedDialChild>[
            SpeedDialChild(
              elevation: 0,
              shape: const CircleBorder(),
              onTap: () {
                ref
                    .read(addImagesNotifierProvider.notifier)
                    .pickImageFromCamera();
              },
              child: const Icon(Icons.photo_camera_rounded),
            ),
            SpeedDialChild(
              elevation: 0,
              shape: const CircleBorder(),
              onTap: () {
                ref.read(addImagesNotifierProvider.notifier).pickMultiImages();
              },
              child: const Icon(Icons.photo_library_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
