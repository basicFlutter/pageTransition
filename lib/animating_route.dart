import 'package:flutter/material.dart';

class AnimatingRoute extends PageRouteBuilder {
  final Widget page;
  AnimatingRoute({required this.page}) : super(
    pageBuilder:(
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) => page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,) => FadeTransition(
             opacity: animation,
              child: child,
    ),
  );
}