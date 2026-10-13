
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'client.dart';
import 'core/theme/app_theme.dart';
import 'features/pantry/presentation/pantry_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeClient();

  runApp(const ProviderScope(child: SaveBiteApp()));
}

class SaveBiteApp extends StatelessWidget {
  const SaveBiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaveBite',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: const PantryScreen(),
    );
  }
}
