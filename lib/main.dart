import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Zomato Clone',
      theme: ThemeData(
        primaryColor: Color.fromARGB(1, 223, 7, 7),
        scaffoldBackgroundColor: Color.fromARGB(1, 243, 242, 242),
      ),

      home: const SplashScreen(),
     
    );
  }
}

