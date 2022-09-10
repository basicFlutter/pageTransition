import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition_animation/animating_route.dart';
import 'package:page_transition_animation/destination.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Navigator.push(
              context,
              AnimatingRoute(
                page: const Destination(),
              ),
            );
            Timer(const Duration(milliseconds: 300), () {
                scaleController.reset();
              },
            );
          }
        },
      );
    scaleAnimation = Tween<double>(begin: 0.0, end: 10.0).animate(scaleController);
  }
  double turns = 0.0;

  void _changeRotation() {
    setState(() => turns += 1.0 );
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: screenWidth * 0.042,
              height: screenHeight * 0.042,
              child: SvgPicture.asset("assets/images/insta.svg",
                  color: Colors.grey),
            ),
            SizedBox(
              width: screenWidth * 0.02,
            ),
            const Text(
              "basic_flutter",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            scaleController.forward();
            _changeRotation();
          },
          child: Container(
            width: 150,
            height: 150,
            decoration:  BoxDecoration(
              color: Colors.grey[850],
              shape: BoxShape.circle,
                boxShadow: [
                   BoxShadow(
                    color: Colors.grey[800]!,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, -3), // changes position of shadow
                  ),
                   BoxShadow(
                    color: Colors.grey[900]!,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset:Offset(0,4), // changes position of shadow
                  ),
                ]
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: scaleAnimation,
                  builder: (c, child) => Transform.scale(
                    scale: scaleAnimation.value,
                    child: Container(
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[900],
                      ),
                    ),
                  ),
                ),
                AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 500),
                  child: const FlutterLogo(size: 50),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}


