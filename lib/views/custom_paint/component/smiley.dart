import 'package:flutter/material.dart';

class Smiley extends StatelessWidget {
  const Smiley({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SmileyPainter(),
      child: Container(),
    );
  }
}

class SmileyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 100));
    Path secondPath = Path();
    secondPath.addOval(Rect.fromCircle(
        center: Offset(size.width / 3, size.height / 3), radius: 10));
    Path thirdPath = Path();
    thirdPath.moveTo(size.width / 9, size.height / 2);
    thirdPath.lineTo(0.0, size.height / 2);

    path.addPath(secondPath, Offset(30.0, 100.0));
    path.addPath(secondPath, Offset(size.width / 2 - 100, 100.0));
    path.addPath(thirdPath, Offset(180.0, 50.0));
    canvas.drawPath(path, paint);
    // Offset center = Offset(size.width / 2, size.height / 2);
    // canvas.drawCircle(center, 100.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
