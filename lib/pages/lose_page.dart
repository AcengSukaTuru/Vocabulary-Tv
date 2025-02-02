import 'package:flutter/material.dart';
import 'package:vocabulary_tv/pages/play_page.dart';
import 'package:vocabulary_tv/pages/mode_page.dart';
import '../models/level_model.dart'; // Pastikan untuk mengimpor model Level

class LosePage extends StatelessWidget {
  final Level level;
  final String mode; // Tambahkan parameter mode

  const LosePage({super.key, required this.level, required this.mode}); // Tambahkan mode ke konstruktor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/lose_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ModePage()),
                );
              },
              child: Image.asset(
                'assets/images/back2_btn.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Game Over',
                    style: TextStyle(
                      color: Color(0xFF10F499),
                      fontSize: 128,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'better luck next time',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 62,
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlayPage(level: level, mode: mode), // Oper level dan mode ke PlayPage
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/retry_btn.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}