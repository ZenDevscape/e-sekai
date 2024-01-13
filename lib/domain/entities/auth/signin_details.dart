import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_details.freezed.dart';

@freezed
class SignInDetails with _$SignInDetails {
  const factory SignInDetails.google() = _GoogleSignInDetails;

  const factory SignInDetails.microsoft() = _MicrosoftSignInDetails;
}
