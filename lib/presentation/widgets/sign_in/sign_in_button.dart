import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final IconData icon;
  final String text;

  /// Tag used to switch from a full-width signin button to mini button
  final bool mini;

  /// onPressed should be specified as a required field to indicate the callback.
  final VoidCallback? onPressed;

  /// Padding of the button's icon.
  ///
  /// Defaults to `EdgeInsets.only(left: 13)`
  final EdgeInsets? iconPadding;

  /// Height of the button.
  final double? height;

  /// Width of the button.
  ///
  /// Defaults to 1/1.5 of the screen
  final double? width;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none], and must not be null.
  final Clip clipBehavior;

  const SignInButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.iconPadding,
    this.mini = false,
    this.height,
    this.width,
    this.clipBehavior = Clip.none,
  });

  Widget _getButtonChild(BuildContext context) {
    if (mini) {
      return SizedBox(
        width: height ?? 45,
        height: width ?? 45,
        child: Icon(
          icon,
          size: 20,
        ),
      );
    } else {
      return Container(
        constraints: BoxConstraints(
          maxWidth: width ?? 220,
        ),
        child: Center(
          child: Row(
            children: <Widget>[
              Padding(
                padding: iconPadding ??
                    const EdgeInsets.only(
                      left: 13,
                    ),
                child: Icon(
                  icon,
                  size: 20,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    text,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      clipBehavior: clipBehavior,
      onPressed: onPressed,
      child: _getButtonChild(context),
    );
  }
}
