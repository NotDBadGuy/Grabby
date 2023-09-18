import 'package:flutter/material.dart';
import 'package:grabby/src/views/splashscreen.dart';

void main() => runApp(const Grabby());

class Grabby extends StatelessWidget {
  const Grabby({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
