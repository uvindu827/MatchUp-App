import 'package:flutter/material.dart';
import 'layout/home_page.dart';
import 'features/Profile/presentation/page/profile_page.dart';
import 'features/Setting_page/presentation/page/setting_page.dart';
import '../features/auth/presentation/pages/splash_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import 'constants/app_theme.dart';

//import 'core/utils/hive_setup.dart'; // ← New: Hive init
import 'package:flutter_riverpod/flutter_riverpod.dart'; // ← New: Riverpod

//  -- old main() --
void main() {
  runApp(const MyApp());
}

// -- new main() with Hive and Riverpod --
// void main() async {
//   // Required for async initialization (Hive, Firebase, etc.)
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize Hive for local storage
//   await HiveSetup.init();

//   // Run the app inside ProviderScope (Riverpod)
//   runApp(const ProviderScope(child: MyApp()));
// }

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
