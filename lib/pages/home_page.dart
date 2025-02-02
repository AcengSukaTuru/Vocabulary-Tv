import 'package:flutter/material.dart';
import 'package:vocabulary_tv/pages/mode_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/home_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0), // Geser ke atas dengan padding
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    'assets/images/text_logo.png',
                    width: 300,
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ModePage()),
                  );
                },
                child: Image.asset(
                  'assets/images/start_btn.png',
                  width: 450,
                  height: 150,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
