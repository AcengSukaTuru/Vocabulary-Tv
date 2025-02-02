import 'package:flutter/material.dart';
import 'package:vocabulary_tv/pages/next_page.dart';
import 'package:vocabulary_tv/pages/lose_page.dart';
import 'package:vocabulary_tv/pages/mode_page.dart';
import 'package:vocabulary_tv/pages/win_page.dart';
import '../models/level_model.dart';

class PlayPage extends StatefulWidget {
  final Level level;
  final String mode; // Tambahkan parameter mode

  const PlayPage({super.key, required this.level, this.mode = 'easy'}); // Default mode adalah 'easy'

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  late List<bool> isSelected; // Menggunakan late untuk inisialisasi nanti
  int energy = 3;
  int correctCount = 0;
  bool isTransitioning = false; // Untuk win transition
  bool isLoseTransition = false; // Untuk lose transition

  @override
  void initState() {
    super.initState();
    isSelected = List.filled(widget.level.items.length, false); // Inisialisasi isSelected
    widget.level.items.shuffle(); // Mengacak items
  }

  void onItemTap(int index) {
    if (isSelected[index] || energy == 0 || isTransitioning || isLoseTransition) {
      return;
    }

    setState(() {
      isSelected[index] = true;
    });

    if (widget.level.correctItems.contains(widget.level.items[index])) {
      setState(() {
        correctCount++;
        if (correctCount == widget.level.correctItems.length) {
          _submitGame(); // Panggil fungsi untuk submit game
        }
      });
    } else {
      setState(() {
        energy--;
        if (energy == 0) {
          _startLoseTransition();
        }
      });

      // Efek merah sementara
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          isSelected[index] = false;
        });
      });
    }
  }


  void _submitGame() {
    setState(() {
      isTransitioning = true;
    });
    Future.delayed(const Duration(seconds: 3), () {
      if (widget.level.id == 5) { // Cek apakah level adalah level kelima
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WinPage()), // Arahkan ke WinPage
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NextPage(completedLevel: widget.level, mode: widget.mode),),
        );
      }
    });
  }

void _startLoseTransition() {
  setState(() {
    isLoseTransition = true;
  });
  Future.delayed(const Duration(seconds: 3), () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LosePage(level: widget.level, mode: widget.mode), // Oper level dan mode ke LosePage
      ),
    );
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isTransitioning
          ? _buildWinTransition()
          : isLoseTransition
              ? _buildLoseTransition()
              : _buildGameContent(),
    );
  }

  Widget _buildWinTransition() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Color(0xFF181319)),
        ),
        Positioned(
          right: -50,
          top: -50,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: widget.mode == 'easy' ? const Color(0xFF23B5D3) : Colors.red, // Warna berdasarkan mode
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          right: 30,
          top: 1,
          child: Text(
            '${widget.level.id}st', // Menampilkan ID level
            style: const TextStyle(
              color: Colors.black,
              fontSize: 96,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 100,
          child: const Text(
            'Channel',
            style: TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
 ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.level.imageAsset, // Menggunakan gambar dari level
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 20),
              const Text(
                'Channel Fixed!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 64.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoseTransition() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Color(0xFF181319)),
        ),
        Positioned(
          right: -50,
          top: -50,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: widget.mode == 'easy' ? const Color(0xFF23B5D3) : Colors.red, // Warna berdasarkan mode
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          right: 30,
          top: 1,
          child: Text(
            '${widget.level.id}st', // Menampilkan ID level
            style: const TextStyle(
              color: Colors.black,
              fontSize: 96,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 100,
          child: const Text(
            'Channel',
            style: TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Oh',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 64.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Image.asset(
                    'assets/images/lose_tv.png',
                    width: 300,
                    height: 300,
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'No!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 64.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Channel Corrupted!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 64.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGameContent() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Color(0xFF181319)),
        ),
        Positioned(
          right: -50,
          top: -50,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: widget.mode == 'easy' ? const Color(0xFF23B5D3) : Colors.red, // Warna berdasarkan mode
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          right: 30,
          top: 1,
          child: Text(
            '${widget.level.id}st', // Menampilkan ID level
            style: const TextStyle(
              color: Colors.black,
              fontSize: 96,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 100,
          child: const Text(
            'Channel',
            style: TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ModePage()),
              );
            },
            child: Image.asset(
              'assets/images/back_btn.png',
              width: 50,
              height: 50,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 0 ,right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.level.imageAsset, // Menggunakan gambar dari level
                width: 200,
                height: 200,
              ),
              const SizedBox(width: 100),
            ],
          ),
        ),
        Positioned(
          left: -30,
          top: MediaQuery.of(context).size.height / 2 - 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                widget.mode == 'easy' 
                    ? 'assets/images/easy_energy_border.png' 
                    : 'assets/images/normal_energy_border.png', // Gambar berdasarkan mode
                width: 150,
                height: 200,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Image.asset(
                      'assets/images/energy.png',
                      width: 50,
                      height: 50,
                      color: index < energy ? null : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Container(
              width: 1200,
              height: 510,
              decoration: BoxDecoration(
                color: const Color(0xFF10F499),
                borderRadius: BorderRadius.circular(25),
              ),
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                itemCount: widget.level.items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => onItemTap(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected[index]
                            ? (widget.level.correctItems.contains(widget.level.items[index])
                                ? Colors.white
                                : Colors.red)
                            : const Color(0xFF181319),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 8,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          widget.level.items[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isSelected[index] &&
                                    widget.level.correctItems.contains(widget.level.items[index])
                                ? Colors.black
                                : const Color(0xFFEBEBEB),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}