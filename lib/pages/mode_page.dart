import 'package:flutter/material.dart';
import 'package:vocabulary_tv/pages/home_page.dart';
import 'package:vocabulary_tv/pages/play_page.dart';
import 'package:vocabulary_tv/models/level_model.dart';
import 'package:vocabulary_tv/data/levels_data.dart';

class ModePage extends StatelessWidget {
  const ModePage({super.key});

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
          Positioned(
            top: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Pilih Tingkat Kesulitan !',
                  style: TextStyle(
                    color: Color(0xFF10F499),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
                SizedBox(height: 20), // Jarak antara teks dan pilihan
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/easy_mode.png',
                          width: 300,
                          height: 300,
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Level easyLevel = LevelsData.getEasyLevels()[0];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlayPage(level: easyLevel, mode: 'easy')), // Pass level ke PlayPage
                            );
                          },
                          child: Image.asset(
                            'assets/images/easy_start_btn.png',
                            width: 300,
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/normal_mode.png',
                          width: 300,
                          height: 300,
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Level normalLevel = LevelsData.getNormalLevels()[0]; // Pilih level normal yang sesuai
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlayPage(level: normalLevel, mode: 'normal')), // Pass level ke PlayPage
                            );
                          },
                          child: Image.asset(
                            'assets/images/normal_start_btn.png',
                            width: 300,
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}