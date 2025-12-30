import 'package:flutter/material.dart';
import '../features/auth/presentation/pages/home_page.dart';
import '../features/auth/presentation/pages/profile_page.dart';
import '../features/auth/presentation/pages/setting_page.dart';
import '../features/auth/presentation/pages/splash_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import 'constants/app_theme.dart';

import 'core/utils/hive_setup.dart'; // ← New: Hive init
import 'package:flutter_riverpod/flutter_riverpod.dart'; // ← New: Riverpod

//  -- old main() --
// void main() {
//   runApp(const MyApp());
// }

void main() async {
  // Required for async initialization (Hive, Firebase, etc.)
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for local storage
  await HiveSetup.init();

  // Run the app inside ProviderScope (Riverpod)
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.AppTitle,
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
