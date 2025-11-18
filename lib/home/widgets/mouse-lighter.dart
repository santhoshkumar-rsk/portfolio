import 'package:flutter/material.dart';

class MouseSpotlight extends StatefulWidget {
  final Widget child;
  const MouseSpotlight({super.key, required this.child});

  @override
  State<MouseSpotlight> createState() => _MouseSpotlightState();
}

class _MouseSpotlightState extends State<MouseSpotlight> {
  Offset _mousePosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _mousePosition = event.position;
        });
      },
      child: Stack(
        children: [
          widget.child,

          // Glow layer
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter: _LightPainter(mousePosition: _mousePosition),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LightPainter extends CustomPainter {
  final Offset mousePosition;

  _LightPainter({required this.mousePosition});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.white.withOpacity(0.25),  // center brightness
          Colors.purple.withOpacity(0.20),
          Colors.transparent,
        ],
        stops: const [0.0, 0.3, 1.0],
      ).createShader(
        Rect.fromCircle(center: mousePosition, radius: 200),
      );

    canvas.drawCircle(mousePosition, 200, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
