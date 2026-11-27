import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trndy_stor/core/Text.dart';
import 'package:trndy_stor/core/color.dart';
import 'package:trndy_stor/core/images.dart';

class getstart_scren extends StatefulWidget {
  getstart_scren({super.key});

  @override
  State<getstart_scren> createState() => _getstart_screnState();
}

class _getstart_screnState extends State<getstart_scren> {
  final PageController _controller = PageController();
  Timer? _timer;
  List<Widget> images = [
    Images.firstlaide,
    Images.second_lade,
    Images.third_lade
  ];

  int currentpage = 0;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (mounted) {
        setState(() {
          if (currentpage < images.length - 1) {
            currentpage++;
          } else {
            currentpage = 0;
          }
          if (_controller.hasClients) {
            _controller.animateToPage(currentpage,
                duration: const Duration(milliseconds: 200),
                curve: Curves.decelerate);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
                child: PageView.builder(
              controller: _controller,
              itemBuilder: (context, index) {
                return images[index];
              },
              itemCount: images.length,
            )),
            Positioned(
                bottom: 270,
                left: 30,
                child: SmoothPageIndicator(
                  controller: _controller,
                  effect: const ExpandingDotsEffect(
                      dotColor: Colors.white,
                      activeDotColor: Colors.black,
                      dotHeight: 10,
                      dotWidth: 10),
                  count: images.length,
                )),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                      width: double.infinity, child: AppText.prressntation3),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 288,
                    height: 56,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Appcolor.prim,
                            foregroundColor: Appcolor.prim),
                        onPressed: () {},
                        child: const Text(
                            style: TextStyle(
                                fontSize: 35.8, color: Appcolor.second),
                            "Get Start.")),
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
