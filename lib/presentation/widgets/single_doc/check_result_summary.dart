import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/checks/check_result.dart';
import '../../viewmodels/single_doc/single_doc_notifier.dart';
import '../../viewmodels/single_doc/single_doc_state.dart';

class CheckResultSummary extends ConsumerWidget {
  final SingleDocState state;

  const CheckResultSummary({
    required this.state,
    super.key,
  });

  String _getAICheckResultClassification(
    AIClassification classification,
  ) {
    switch (classification) {
      case AIClassification.veryUnlikely:
        return 'Very Unlikely';
      case AIClassification.unlikely:
        return 'Unlikely';
      case AIClassification.unclear:
        return 'Unclear';
      case AIClassification.possibly:
        return 'Possibly';
      case AIClassification.likely:
        return 'Likely';
    }
  }

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Card(
        margin: EdgeInsets.zero,
        shadowColor: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 200,
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          child: Builder(builder: (context) {
            if (state.action == SingleDocAction.checking) {
              return const CircularProgressIndicator();
            } else if (state.failure == SingleDocFailure.unableToCheck) {
              return Column(
                children: [
                  const Text('Failed to check document.'),
                  TextButton.icon(
                    icon: const Icon(Icons.refresh),
                    label: const Text('Try Again'),
                    onPressed: () {
                      ref.read(singleDocNotifierProvider.notifier).checkDoc();
                    },
                  ),
                ],
              );
            } else if (state.document.checkResult == null) {
              return Column(
                children: [
                  const Text('No check result yet.'),
                  TextButton.icon(
                    icon: const Icon(Icons.published_with_changes_rounded),
                    label: const Text('Check'),
                    onPressed: () {
                      ref.read(singleDocNotifierProvider.notifier).checkDoc();
                    },
                  ),
                ],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('AI Generated Check'),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Classification'),
                            Text(
                              _getAICheckResultClassification(
                                state.document.checkResult!.ai.classification,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Score'),
                            Text(
                              state.document.checkResult!.ai.score
                                  .toStringAsFixed(2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
