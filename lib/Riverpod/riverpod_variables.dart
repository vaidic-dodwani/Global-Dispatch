//  SIGN IN PAGE
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Riverpod/riverpod_classes.dart';

EmailErrorNotifier signInEmailErrorNotifer = EmailErrorNotifier();

final signInEmailErrorProvider =
    StateNotifierProvider.autoDispose<EmailErrorNotifier, String>((ref) {
  ref.onDispose(() {
    signInEmailErrorNotifer = EmailErrorNotifier();
  });

  return signInEmailErrorNotifer;
});

PassErrorNotifier signInPasswordErrorNotifer = PassErrorNotifier();

final signInPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>((ref) {
  ref.onDispose(() {
    signInPasswordErrorNotifer = PassErrorNotifier();
  });
  return signInPasswordErrorNotifer;
});

ButtonLoaderNotifier signInButtonLoaderNotifier = ButtonLoaderNotifier();

final signInButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  ref.onDispose(() {
    signInButtonLoaderNotifier = ButtonLoaderNotifier();
  });
  return signInButtonLoaderNotifier;
});

// SIGN UP

EmailErrorNotifier signUpEmailErrorNotifer = EmailErrorNotifier();

final signUpEmailErrorProvider =
    StateNotifierProvider.autoDispose<EmailErrorNotifier, String>((ref) {
  ref.onDispose(() {
    signUpEmailErrorNotifer = EmailErrorNotifier();
  });
  return signUpEmailErrorNotifer;
});

ButtonLoaderNotifier signUpEmailButtonLoaderNotifier = ButtonLoaderNotifier();

final signUpEmailButtonLoaderProvider =
    StateNotifierProvider.autoDispose<ButtonLoaderNotifier, bool>((ref) {
  ref.onDispose(() {
    signUpEmailButtonLoaderNotifier = ButtonLoaderNotifier();
  });
  return signUpEmailButtonLoaderNotifier;
});

PassErrorNotifier signUpPasswordErrorNotifer = PassErrorNotifier();

final signUpPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>((ref) {
  ref.onDispose(() {
    signUpPasswordErrorNotifer = PassErrorNotifier();
  });

  return signUpPasswordErrorNotifer;
});

PassErrorNotifier signUpConfirmPasswordErrorNotifer = PassErrorNotifier();

final signUpConfirmPasswordErrorProvider =
    StateNotifierProvider.autoDispose<PassErrorNotifier, String>((ref) {
  ref.onDispose(() {
    signUpConfirmPasswordErrorNotifer = PassErrorNotifier();
  });
  return signUpConfirmPasswordErrorNotifer;
});
