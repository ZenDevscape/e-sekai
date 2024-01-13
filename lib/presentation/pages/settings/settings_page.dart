import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/settings/user_notifier.dart';
import '../../viewmodels/settings/user_state.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final UserState userState = ref.read(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    userState.user?.photoUrl ?? '',
                  ),
                ),
                title: Text(
                  userState.user?.name ?? 'Anonymous',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  userState.user?.emailAddress ?? 'someone@something.com',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
                elevation: 1,
                shadowColor: Colors.transparent,
                margin: EdgeInsets.zero,
                child: Column(
                  children: [
                    ListTile(
                      minLeadingWidth: 0,
                      horizontalTitleGap: 0,
                      contentPadding: const EdgeInsets.only(right: 15),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      leading: Container(
                        alignment: Alignment.center,
                        width: 60,
                        child: const Icon(
                          Icons.logout,
                        ),
                      ),
                      title: const Text(
                        'Sign Out',
                      ),
                      subtitle: const Text(
                        'Sign out of your account',
                      ),
                      onTap: () {
                        ref.read(userNotifierProvider.notifier).signOut();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
