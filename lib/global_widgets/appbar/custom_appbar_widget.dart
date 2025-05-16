import 'package:ct_kor_chok_dee_app/utils/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomAppbarWidget extends StatefulWidget {
  final Function()? onLogoTapped;
  const CustomAppbarWidget({this.onLogoTapped, super.key});

  @override
  State<CustomAppbarWidget> createState() => _CustomAppbarWidgetState();
}

class _CustomAppbarWidgetState extends State<CustomAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedClipper(),
      child: Container(
        color: context.theme.colorScheme.primary,
        height: MediaQuery.of(context).size.height * 0.190,
        child: GestureDetector(
          onTap: () {
            // Handle tap event here
            widget.onLogoTapped?.call();
          },
          child: const Center(
            child: Image(
              image: AssetImage('assets/logo/ctlogo.png'),
              height: 120,
              width: 120,
            ),
          ),
        ),
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40); // comece quase no fim
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
