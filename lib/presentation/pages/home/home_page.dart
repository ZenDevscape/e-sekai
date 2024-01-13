import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../viewmodels/add_file/add_file_notifier.dart';
import '../../viewmodels/add_file/add_file_state.dart';
import '../../viewmodels/add_images/add_images_notifier.dart';
import '../../viewmodels/home/home_notifier.dart';
import '../../viewmodels/home/home_state.dart';
import '../../viewmodels/single_doc/text_notifier.dart';
import '../../widgets/home/document_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration.zero,
      () {
        ref.read(homeNotifierProvider.notifier).getDocs();
      },
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    ref.listen(
      addFileNotifierProvider,
      (previousState, nextState) {
        nextState.whenOrNull(
          failed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to add file'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'E-Sekai',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () {
            context.push('/settings');
          },
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          final HomeState state = ref.watch(homeNotifierProvider);

          return state.when(
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            loaded: (documents) {
              return RefreshIndicator(
                onRefresh: () async {
                  ref.read(homeNotifierProvider.notifier).getDocs();
                },
                child: Builder(
                  builder: (context) {
                    if (documents.isEmpty) {
                      return CustomScrollView(
                        slivers: <Widget>[
                          SliverFillRemaining(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: SvgPicture.asset(
                                    'assets/images/no_document.svg',
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    semanticsLabel: 'No Document',
                                  ),
                                ),
                                const Text(
                                  'No document yet.\nStart checking your document now!',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 15,
                        ),
                        child: ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            return DocumentCard(
                              document: documents[index],
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              );
            },
            failedToLoadData: () {
              return RefreshIndicator(
                onRefresh: () async {
                  ref.read(homeNotifierProvider.notifier).getDocs();
                },
                child: const CustomScrollView(
                  slivers: <Widget>[
                    SliverFillRemaining(
                      child: Center(
                        child: Text('No document yet.'),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
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
            onTap: () async {
              await ref
                  .read(addImagesNotifierProvider.notifier)
                  .pickImageFromCamera();

              if (context.mounted) {
                context.push('/doc/add-images');
              }
            },
            child: const Icon(Icons.photo_camera_rounded),
          ),
          SpeedDialChild(
            elevation: 0,
            shape: const CircleBorder(),
            onTap: () async {
              await ref
                  .read(addImagesNotifierProvider.notifier)
                  .pickMultiImages();

              if (context.mounted) {
                context.push('/doc/add-images');
              }
            },
            child: const Icon(Icons.photo_library_rounded),
          ),
          SpeedDialChild(
            elevation: 0,
            shape: const CircleBorder(),
            onTap: () async {
              await ref.read(addFileNotifierProvider.notifier).pickFile();

              final AddFileState state = ref.read(addFileNotifierProvider);

              state.whenOrNull(
                loaded: (file) async {
                  await ref
                      .read(textNotifierProvider.notifier)
                      .extractTextFromFile(file);

                  ref.read(addImagesNotifierProvider.notifier).clearImages();

                  final String text = ref.read(textNotifierProvider);

                  if (context.mounted) {
                    context.push(Uri(
                      path: '/doc/new',
                      queryParameters: {
                        'initial_text': text,
                      },
                    ).toString());
                  }
                },
              );
            },
            child: const Icon(Icons.description_rounded),
          ),
          SpeedDialChild(
            elevation: 0,
            shape: const CircleBorder(),
            onTap: () {
              context.push('/doc/new');
            },
            child: const Icon(Icons.edit_rounded),
          ),
        ],
      ),
    );
  }
}
