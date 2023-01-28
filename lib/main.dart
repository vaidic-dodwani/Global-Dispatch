import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Config/api_functions.dart';
import 'package:globaldispatch/Routing/routing.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAuth();
  // FlutterNativeSplash.remove();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(
        colorScheme:
            const ColorScheme.light().copyWith(primary: Palette.primaryColor),
      ),
      // theme: ThemeData(primaryColor: Colors.lightBlue.withOpacity(0.8)),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
