import 'package:flutter/material.dart';
import 'dart:math';

extension ContextTheme on BuildContext {
  ThemeData get theme => Theme.of(this);

  Future<T?> goPush<T>(Widget page) {
    return Navigator.push<T>(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> goPushAnimated<T>(Widget page) {
    final size = MediaQuery.of(this).size;
    final centerTop = Offset(size.width / 2, 0);

    return Navigator.push<T>(
      this,
      PageRouteBuilder<T>(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final radiusTween = Tween<double>(
            begin: 0.0,
            end: _calculateMaxRadius(context, centerTop),
          );

          final radiusAnimation = animation
              .drive(CurveTween(curve: Curves.easeOut))
              .drive(radiusTween);

          return AnimatedBuilder(
            animation: animation,
            builder: (context, _) {
              return ClipPath(
                clipper: CircleRevealClipper(
                  radius: radiusAnimation.value,
                  center: centerTop,
                ),
                child: child,
              );
            },
          );
        },
      ),
    );
  }

  double _calculateMaxRadius(BuildContext context, Offset center) {
    final size = MediaQuery.of(context).size;
    final topLeft = (center - Offset(0, 0)).distance;
    final topRight = (center - Offset(size.width, 0)).distance;
    final bottomLeft = (center - Offset(0, size.height)).distance;
    final bottomRight = (center - Offset(size.width, size.height)).distance;

    return [topLeft, topRight, bottomLeft, bottomRight].reduce(max);
  }
}

class CircleRevealClipper extends CustomClipper<Path> {
  final double radius;
  final Offset center;

  CircleRevealClipper({required this.radius, required this.center});

  @override
  Path getClip(Size size) {
    return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(CircleRevealClipper oldClipper) {
    return radius != oldClipper.radius || center != oldClipper.center;
  }
}
