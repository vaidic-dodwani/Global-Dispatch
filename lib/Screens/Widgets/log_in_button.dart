// ignore_for_file: must_be_immutable



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Riverpod/riverpod_classes.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

class LogInButton extends ConsumerWidget {
  final String text;
  final void Function()? function;
  final AutoDisposeStateNotifierProvider<ButtonLoaderNotifier, bool>?
      loaderProvider;
  bool isloading = false;
  final double? width;
  LogInButton(
      {super.key,
      required this.text,
      this.function,
      this.loaderProvider,
      this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    isloading = loaderProvider != null ? ref.watch(loaderProvider!) : false;
    return !isloading
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: width ?? MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                  onPressed: function,
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Palette.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    text,
                    style: titleMedium(),
                  )),
            ),
          )
        : const SizedBox(
            height: 44,
            child: Center(
              child: SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  color: Palette.primaryColor,
                ),
              ),
            ),
          );
  }
}
