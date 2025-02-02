import 'package:flutter/material.dart';
import 'package:vocabulary_tv/pages/play_page.dart';
import 'package:vocabulary_tv/data/levels_data.dart';
import 'package:vocabulary_tv/models/level_model.dart';

class NextPage extends StatelessWidget {
  final Level completedLevel; // Ganti nama field untuk level yang telah diselesaikan
  final String mode; // Tambahkan parameter mode

  const NextPage({super.key, required this.completedLevel, required this.mode}); // Tambahkan parameter ke konstruktor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/mode_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${completedLevel.id}st Channel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 128,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Inter',
                    ),
                  ),
                  Text(
                    'Complete',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 62,
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Next Channel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 62,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          // Ambil level berikutnya berdasarkan ID dan mode
                          Level nextLevel;
                          if (mode == 'easy') {
                            nextLevel = LevelsData.getEasyLevels()[completedLevel.id]; // Ambil level berikutnya untuk mode easy
                          } else {
                            nextLevel = LevelsData.getNormalLevels()[completedLevel.id]; // Ambil level berikutnya untuk mode normal
                          }
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlayPage(level: nextLevel, mode: mode), // Pass level ke PlayPage
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/next_btn.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}