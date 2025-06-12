import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedWaveBackground extends StatefulWidget {
  final double angle;

  const AnimatedWaveBackground({super.key, this.angle = 0});

  @override
  State<AnimatedWaveBackground> createState() => _AnimatedWaveBackgroundState();
}

class _AnimatedWaveBackgroundState extends State<AnimatedWaveBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _WavePainter(phase: _controller.value * 2 * pi, angle: widget.angle),
          size: Size.infinite,
        );
      },
    );
  }
}

class _WavePainter extends CustomPainter {
  final double phase;
  final double angle; // graus

  _WavePainter({required this.phase, required this.angle});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.grey.shade300.withAlpha(60)
          ..style = PaintingStyle.fill;

    final path = Path();

    // Ajuste o ângulo da onda
    final radians = angle * pi / 180;
    final amplitude = size.height * 0.08;
    final baseY = size.height * 0.5;

    path.moveTo(0, size.height);
    for (double x = 0; x <= size.width; x += 1) {
      // Onda senoidal com ângulo
      final waveY = amplitude * sin((x / size.width * 2 * pi) + phase);
      final y = baseY + waveY + x * tan(radians);
      path.lineTo(x, y);
    }
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) => oldDelegate.phase != phase || oldDelegate.angle != angle;
}
