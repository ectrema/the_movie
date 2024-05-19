import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie/application/injections/initializer.dart';
import 'package:the_movie/ui/screens/main.screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeInjections();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The movie',
      home: MainScreen(),
    );
  }
}
