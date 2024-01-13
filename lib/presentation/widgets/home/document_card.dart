import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/documents/document.dart';
import '../../viewmodels/home/home_notifier.dart';

class DocumentCard extends ConsumerWidget {
  final Document document;

  const DocumentCard({
    required this.document,
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const BehindMotion(),
            children: <Widget>[
              SlidableAction(
                backgroundColor: const Color.fromRGBO(254, 74, 73, 1),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                onPressed: (BuildContext context) {
                  ref.read(homeNotifierProvider.notifier).deleteDoc(document);
                },
              )
            ],
          ),
          child: Card(
            elevation: 1,
            shadowColor: Colors.transparent,
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: ListTile(
              title: Text(document.title),
              subtitle:
                  Text(DateFormat('d MMMM yyyy').format(document.createdAt)),
              onTap: () {
                context.push('/doc/${document.id}');
              },
            ),
          ),
        ),
      ),
    );
  }
}
