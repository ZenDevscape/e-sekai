import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../injection.dart';
import '../pages/add_images/add_images_page.dart';
import '../pages/home/home_page.dart';
import '../pages/settings/settings_page.dart';
import '../pages/sign_in/sign_in_page.dart';
import '../pages/single_doc/single_doc_page.dart';
import '../viewmodels/settings/user_notifier.dart';
import '../viewmodels/settings/user_state.dart';

part 'router.g.dart';

@riverpod
GoRouter router(
  RouterRef ref,
) {
  final UserState userState = ref.watch(userNotifierProvider);

  return GoRouter(
    navigatorKey: getIt<GlobalKey<NavigatorState>>(
      instanceName: 'rootNavigatorKey',
    ),
    initialLocation: '/',
    redirect: (
      BuildContext context,
      GoRouterState state,
    ) {
      final isOnSignInPage = state.location == '/sign-in';

      return userState.whenOrNull(
        loaded: (_) {
          return isOnSignInPage ? '/' : null;
        },
        unauthenticated: (_) {
          return isOnSignInPage ? null : '/sign-in';
        },
      );
    },
    routes: <RouteBase>[
      GoRoute(
        name: 'Home',
        path: '/',
        builder: (
          BuildContext context,
          GoRouterState state,
        ) {
          return const HomePage();
        },
      ),
      GoRoute(
        name: 'SignIn',
        path: '/sign-in',
        builder: (
          BuildContext context,
          GoRouterState state,
        ) {
          return const SignInPage();
        },
      ),
      GoRoute(
        name: 'Settings',
        path: '/settings',
        builder: (
          BuildContext context,
          GoRouterState state,
        ) {
          return const SettingsPage();
        },
      ),
      GoRoute(
        name: 'AddImages',
        path: '/doc/add-images',
        builder: (
          BuildContext context,
          GoRouterState state,
        ) {
          return const AddImagesPage();
        },
      ),
      GoRoute(
        name: 'SingleDoc',
        path: '/doc/:doc_id',
        builder: (
          BuildContext context,
          GoRouterState state,
        ) {
          return SingleDoc(
            documentId: state.pathParameters['doc_id']!,
            initialText: state.queryParameters['initial_text'],
          );
        },
      ),
    ],
  );
}
