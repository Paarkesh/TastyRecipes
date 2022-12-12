import 'package:flutter/material.dart';

class Line extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 5;
    paint.strokeCap = StrokeCap.round;

    Offset startingOffset = Offset(0, size.height);
    Offset endingOffset = Offset(size.width, size.height);

    canvas.drawLine(startingOffset, endingOffset, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Circle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.amber;
    paint.style = PaintingStyle.fill;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;

    Offset offset = Offset(size.width * 0.5, size.height);
    canvas.drawCircle(offset, 30, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Arc extends CustomPainter {
  double _degreeToRadians(num degree) {
    return (degree * 3.14) / 180.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(0, 0, size.width, size.height * 2);
    double startAngle = _degreeToRadians(0);
    double sweepAngle = _degreeToRadians(180);
    const useCenter = false;

    Paint paint = Paint();
    paint.color = Colors.amber;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 4;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Rectangle extends CustomPainter {
  bool? isFilled;
  Rectangle({this.isFilled});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    if (isFilled == null) {
      paint.style = PaintingStyle.fill;
    } else {
      paint.style = PaintingStyle.stroke;
    }
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeWidth = 5;
    Offset offset = Offset(size.width * 0.5, size.height);

    Rect rect = Rect.fromCenter(center: offset, width: 30, height: 50);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant Rectangle oldDelegate) {
    return false;
  }
}

class ThirdRoute extends StatefulWidget {
  const ThirdRoute({Key? key}) : super(key: key);
  @override
  _ShapesPageState createState() => _ShapesPageState();
}

class _ShapesPageState extends State<ThirdRoute> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Graphical Primitives',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.amber,
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(5, 30.0, 5, 30.0),
            child: Center(
                child: Column(
              children: [
                CustomPaint(
                  size: Size(40.0, 40.0),
                  painter: Line(),
                ),
                CustomPaint(
                  size: Size(80.0, 40.0),
                  painter: Line(),
                ),
                CustomPaint(
                  size: Size(40.0, 40.0),
                  painter: Circle(),
                ),
                CustomPaint(
                  size: Size(80.0, 40.0),
                  painter: Arc(),
                ),
                CustomPaint(
                  size: Size(160, 80.0),
                  painter: Rectangle(),
                ),
              ],
            ))));
  }
}
