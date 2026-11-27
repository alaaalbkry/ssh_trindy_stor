import 'package:flutter/material.dart';
import 'package:trndy_stor/core/Text.dart';

class start_page extends StatelessWidget {
  const start_page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(
        children: [
          Positioned(
            top: 1,
            right: 0,
            child: Image.asset("assets/frame 2.png"),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: AppText.prsintation,
              ),
              AppText.prsintation2
            ],
          ),
          Positioned(
            bottom: 0.0,
            left: 0,
            child: Image.asset("assets/frame 2 (1).png"),
          )
        ],
      )),
    );
  }
}
