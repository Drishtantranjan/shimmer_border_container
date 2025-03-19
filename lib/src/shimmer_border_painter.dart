import 'package:flutter/material.dart';
import 'dart:math';

class ShimmerBorderContainer extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final Duration shimmerDuration;
  final Color shimmerColor;
  final Widget child;
  final Color backgroundColor;

  const ShimmerBorderContainer({
    super.key,
    required this.child,
    this.width = 250,
    this.height = 70,
    this.borderRadius = 12,
    this.borderWidth = 1.0,
    this.shimmerDuration = const Duration(seconds: 2),
    this.shimmerColor = Colors.white,
    this.backgroundColor = const Color(0xFF0F1113),
  });

  @override
  State<ShimmerBorderContainer> createState() => _ShimmerBorderContainerState();
}

class _ShimmerBorderContainerState extends State<ShimmerBorderContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.shimmerDuration,
    )..repeat();
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
          painter: _AnimatedShimmerBorderPainter(
            progress: _controller.value,
            borderRadius: widget.borderRadius,
            borderWidth: widget.borderWidth,
            shimmerColor: widget.shimmerColor,
          ),
          child: Container(
            width: widget.width,
            height: widget.height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.backgroundColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}

class _AnimatedShimmerBorderPainter extends CustomPainter {
  final double progress;
  final double borderRadius;
  final double borderWidth;
  final Color shimmerColor;

  _AnimatedShimmerBorderPainter({
    required this.progress,
    required this.borderRadius,
    required this.borderWidth,
    required this.shimmerColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final borderRect = Rect.fromLTWH(
      borderWidth / 2,
      borderWidth / 2,
      size.width - borderWidth,
      size.height - borderWidth,
    );

    final borderPaint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawRRect(
      RRect.fromRectAndRadius(borderRect, Radius.circular(borderRadius)),
      borderPaint,
    );

    final sweepGradient = SweepGradient(
      startAngle: 0,
      endAngle: 2 * pi,
      transform: GradientRotation(2 * pi * progress),
      colors: [
        Colors.transparent,
        shimmerColor.withOpacity(0.8),
        shimmerColor,
        shimmerColor.withOpacity(0.8),
        Colors.transparent,
      ],
      stops: const [0.0, 0.45, 0.5, 0.55, 1.0],
    );

    final shimmerPaint = Paint()
      ..shader = sweepGradient.createShader(borderRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawRRect(
      RRect.fromRectAndRadius(borderRect, Radius.circular(borderRadius)),
      shimmerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _AnimatedShimmerBorderPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
