import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mining_solutions/screens/home_page.dart';
import 'package:mining_solutions/theme.dart';

class CheckReady extends StatefulWidget {
  const CheckReady({Key? key}) : super(key: key);

  @override
  State<CheckReady> createState() => _CheckReadyState();
}

class _CheckReadyState extends State<CheckReady> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("Holaa");
        goToNewScren();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Load a Lottie file from your assets
            Lottie.asset(
              'assets/check-mark-success.json',
              width: 100,
              height: 100,
              controller: _controller,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                _controller
                  ..duration = composition.duration
                  ..forward();

                //goToNewScren();
              },
            ),
            SizedBox(height: 20),
            Text("¡Ya lo tienes!", style: subHeadingTextStyle)
          ],
        ),
      ),
    );
  }

  void goToNewScren() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => HomePage()),
        (Route<dynamic> route) => false);
  }
}
