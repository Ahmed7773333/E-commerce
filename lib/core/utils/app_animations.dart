import 'package:flutter/material.dart';

class TopRouting extends PageRouteBuilder {
  final dynamic page;
  TopRouting(this.page)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tween =
                Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero);
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}

class RightRouting extends PageRouteBuilder {
  final dynamic page;
  RightRouting(this.page)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tween =
                Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero);
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}

class LeftRouting extends PageRouteBuilder {
  final dynamic page;
  LeftRouting(this.page)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tween =
                Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero);
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
