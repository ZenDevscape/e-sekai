import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_icons/simple_icons.dart';

import '../../viewmodels/sign_in/sign_in_notifier.dart';
import '../../widgets/sign_in/sign_in_button.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    ref.listen(
      signInNotifierProvider,
      (previousState, nextState) {
        nextState.whenOrNull(
          failed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to sign in'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        );
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/sign_in.svg',
                      width: MediaQuery.of(context).size.width * 0.7,
                      semanticsLabel: 'Sign In',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        'Sign In',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: SignInButton(
                        icon: SimpleIcons.google,
                        text: 'Sign in with Google',
                        onPressed: () {
                          ref
                              .read(signInNotifierProvider.notifier)
                              .signInWithGoogle();
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: SignInButton(
                        icon: SimpleIcons.microsoft,
                        text: 'Sign in with Microsoft',
                        onPressed: () {
                          ref
                              .read(signInNotifierProvider.notifier)
                              .signInWithMicrosoft();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
