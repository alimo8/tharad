import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tharad/core/ui/app_image.dart';

class DocumentUploadWidget extends StatelessWidget {
  const DocumentUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: DashedBorderPainter(
          color: Colors.grey,
          strokeWidth: 2,
          dashWidth: 6,
          dashSpace: 4,
          radius: 12,
        ),
        child: Container(
          height: 105,
          width: 350,
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage(imageUrl: 'camera.svg', height: 30),
              SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                'الملفات المسموح بيها :  JPEG , PNG \n الحد الاقصي : 5MB',
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double radius;

  DashedBorderPainter({
    required this.color,
    this.strokeWidth = 2,
    this.dashWidth = 5,
    this.dashSpace = 3,
    this.radius = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius),
        ),
      );

    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final segment = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(segment, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
