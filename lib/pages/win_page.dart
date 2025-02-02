import 'package:flutter/material.dart';
import 'package:vocabulary_tv/pages/mode_page.dart';


class WinPage extends StatelessWidget {
  const WinPage({super.key});

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
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Congratulations!',
                    style: TextStyle(
                      color: Color(0xFF10F499),
                      fontSize: 128,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'You are a Reliable Fixer now !',
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
                        MaterialPageRoute(builder: (context) => ModePage()), // Pass level ke PlayPage
                      );
                    },
                    child: Image.asset(
                      'assets/images/home_btn.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}