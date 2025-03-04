import 'package:flutter/material.dart';
import 'package:nodelabs_movie/config/theme/app_theme.dart';
import 'package:nodelabs_movie/injection_container.dart';
import 'package:nodelabs_movie/presentation/pages/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nodelabs Movie',
      theme: AppTheme.theme,
      home: const LoginScreen(),
    ),
  );
}
