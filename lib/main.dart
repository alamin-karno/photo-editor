import 'package:flutter/material.dart';
import 'package:photo_editor/core/providers/image_provider.dart';
import 'package:photo_editor/features/crop/presentation/ui/crop_screen.dart';
import 'package:photo_editor/features/filter/presentation/ui/filter_screen.dart';
import 'package:photo_editor/features/home/presentation/ui/home_screen.dart';
import 'package:photo_editor/features/start/presentation/ui/start_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppImageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Editor',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF111111),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      routes: {
        '/': (_) => const StartScreen(),
        '/home': (_) => const HomeScreen(),
        '/crop': (_) => const CropScreen(),
        '/filter': (_) => const FilterScreen(),
      },
      initialRoute: '/',
    );
  }
}
