import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:esekai/presentation/viewmodels/single_doc/single_doc_notifier.dart';

import '../../viewmodels/single_doc/single_doc_state.dart';
import '../../widgets/single_doc/check_result_summary.dart';

class SingleDoc extends ConsumerStatefulWidget {
  final String documentId;
  final String? initialText;

  const SingleDoc({
    super.key,
    required this.documentId,
    this.initialText,
  });

  @override
  ConsumerState<SingleDoc> createState() => _SingleDocState();
}

class _SingleDocState extends ConsumerState<SingleDoc> {
  late TextEditingController _titleController;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController();
    _textController = TextEditingController();

    Future.delayed(
      Duration.zero,
      () {
        if (widget.documentId == 'new') {
          ref
              .read(singleDocNotifierProvider.notifier)
              .initializeDoc(widget.initialText);
        } else {
          ref
              .read(singleDocNotifierProvider.notifier)
              .getDoc(widget.documentId);
        }
      },
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SingleDocState state = ref.watch(singleDocNotifierProvider);

    ref.listen(
      singleDocNotifierProvider,
      (prevState, nextState) {
        nextState.whenOrNull(
          edit: (document, _, failure, __) {
            if (failure == SingleDocFailure.deleted) {
              context.pop();
            }

            _titleController.text = document.title;
            _textController.text = document.text;
            _titleController.selection = TextSelection.fromPosition(
              TextPosition(offset: _titleController.text.length),
            );
            _textController.selection = TextSelection.fromPosition(
              TextPosition(offset: _textController.text.length),
            );
          },
          loaded: (document, _, failure, __) {
            if (failure == SingleDocFailure.deleted) {
              context.pop();
            }

            _titleController.text = document.title;
            _textController.text = document.text;
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: state.whenOrNull(
          edit: (_, action, __, saved) {
            return [
              if (saved)
                IconButton(
                  icon: const Icon(Icons.delete_rounded),
                  onPressed: () async {
                    await ref
                        .read(singleDocNotifierProvider.notifier)
                        .deleteDoc();
                  },
                ),
              action != SingleDocAction.saving
                  ? IconButton(
                      icon: const Icon(Icons.check_rounded),
                      onPressed: () async {
                        ref.read(singleDocNotifierProvider.notifier).insertDoc(
                              _titleController.text,
                              _textController.text,
                            );

                        if (saved) {
                          await ref
                              .read(singleDocNotifierProvider.notifier)
                              .updateDoc();
                        } else {
                          await ref
                              .read(singleDocNotifierProvider.notifier)
                              .addDoc();
                        }

                        ref.read(singleDocNotifierProvider.notifier).checkDoc();
                      },
                    )
                  : const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Center(
                        heightFactor: 1,
                        widthFactor: 1,
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
            ];
          },
          loaded: (_, __, ___, ____) {
            return [
              IconButton(
                icon: const Icon(Icons.delete_rounded),
                onPressed: () async {
                  await ref
                      .read(singleDocNotifierProvider.notifier)
                      .deleteDoc();
                },
              ),
              IconButton(
                icon: const Icon(Icons.edit_rounded),
                onPressed: () {
                  ref.read(singleDocNotifierProvider.notifier).switchToEdit();
                },
              ),
            ];
          },
        ),
      ),
      body: Builder(
        builder: (
          context,
        ) {
          return state.when(
            initial: (_, __, failure, ___) {
              if (failure == SingleDocFailure.unableToLoad) {
                return RefreshIndicator(
                  onRefresh: () async {
                    ref.read(singleDocNotifierProvider.notifier).getDoc(
                          widget.documentId,
                        );
                  },
                  child: const CustomScrollView(
                    slivers: <Widget>[
                      SliverFillRemaining(
                        child: Center(
                          child: Text('Failed to load document.'),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            edit: (document, _, __, ___) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: TextField(
                      controller: _titleController,
                      maxLines: 1,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Title',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: TextField(
                      controller: _textController,
                      autofocus: true,
                      expands: true,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                        hintText: 'Type or paste your text...',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                      ),
                    ),
                  ),
                ],
              );
            },
            loaded: (document, action, __, ___) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      readOnly: true,
                      maxLines: 1,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Title',
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        fillColor: Theme.of(context).canvasColor,
                      ),
                    ),
                    CheckResultSummary(
                      state: state,
                    ),
                    TextField(
                      controller: _textController,
                      readOnly: true,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Text',
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        fillColor: Theme.of(context).canvasColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
