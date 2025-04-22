import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/welcome');
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/objects.png',
              height: 343.94,
              width: 334, 
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text('TODO', 
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontFamily: 'Lexend Deca',
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}