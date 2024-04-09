import 'package:flawlessly/screens/home_screen.dart';
import 'package:flutter/material.dart';
import './screens/launch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flawlessly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        fontFamily: 'Figtree',
        useMaterial3: true,
      ),
      initialRoute: LaunchScreen.route,
      routes: {
        LaunchScreen.route: (context) => const LaunchScreen(),
        HomeScreen.route: (context) => const HomeScreen(),
      },
    );
  }
}
