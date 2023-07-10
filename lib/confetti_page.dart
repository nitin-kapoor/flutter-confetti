import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiPage extends StatefulWidget {
  const ConfettiPage({super.key});

  @override
  State<ConfettiPage> createState() => _ConfettiPage();
}

class _ConfettiPage extends State<ConfettiPage> {
  final _controller = ConfettiController();
  bool isPlaying = false;
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Rewards"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 300.0),
              child: Center(
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 15,
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.deepPurple,
                    ),
                    onPressed: () {
                      if (isPlaying) {
                        _controller.stop();
                      } else {
                        _controller.play();
                      }
                      isPlaying = !isPlaying;
                    },
                    child: const Text(
                      'Celebrate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ConfettiWidget(
                confettiController: _controller,
                blastDirection: -pi / 2, // Ex. Left, Right, Top, Down
                emissionFrequency: 0.05, // how often it should emit
                numberOfParticles: 20, // number of particles to emit
                gravity: 0.05 // Fall Speed
                ),
          ],
        ),
      ),
    );
  }
}
