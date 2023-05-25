import 'dart:math';

import 'package:bilim_all/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../../constants/app_styles.dart';

class ProgressLine extends StatefulWidget {
  const ProgressLine({Key? key}) : super(key: key);

  @override
  State<ProgressLine> createState() => _ProgressLineState();
}

class _ProgressLineState extends State<ProgressLine> {
  final double a = 55;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 500,
              child: CustomPaint(
                painter: MyPainter(a: a),
              ),
            ),
            const SizedBox(height: 5,),
            Text('$a% complete',style: AppStyles.s8w500.copyWith(color: AppColors.neutralTextColor),)
          ],
        ),
      );
  }
}

class MyPainter extends CustomPainter {
  final double a;
  MyPainter({required this.a});
  final painter = Paint()..strokeWidth = 3;
  @override
  void paint(Canvas canvas, Size size) {
    painter.isAntiAlias = true;
    painter.style = PaintingStyle.stroke;
    painter.color = AppColors.progressLineColor;
    painter.strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(0, size.height / 2),
        Offset(size.width, size.height / 2), painter);
    painter.style = PaintingStyle.fill;
    painter.color = AppColors.progressLineColor;
    painter.strokeCap = StrokeCap.round;
    canvas.drawCircle(Offset(size.width * a * 0.01, size.height / 2),
        7, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
