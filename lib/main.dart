import 'package:flutter/material.dart';
import 'package:photo_editor/core/providers/image_provider.dart';
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
      ),
      routes: {
        '/': (_) => const StartScreen(),
        '/home': (_) => const HomeScreen(),
      },
      initialRoute: '/',
    );
  }
}
