import 'dart:math' as math;

import 'package:flutter/material.dart';

class WidgetCountDownPelada extends StatefulWidget {
  @override
  _WidgetCountDownPeladaState createState() => _WidgetCountDownPeladaState();
}

class _WidgetCountDownPeladaState extends State<WidgetCountDownPelada>
    with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.black,
      child: SizedBox(
        height: 230,
        width: 200,
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: CustomPaint(
                                        painter: CustomTimerPainter(
                                      animation: controller,
                                      backgroundColor: Colors.white,
                                      color: themeData.indicatorColor,
                                    )),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      timerString,
                                      style: TextStyle(
                                          fontSize: 70.0, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        FlatButton(
                          child:
                              Text(controller.isAnimating ? "Pause" : "Play"),
                          onPressed: () {
                            if (controller.isAnimating)
                              controller.stop();
                            else {
                              controller.reverse(
                                  from: controller.value == 0.0
                                      ? 1.0
                                      : controller.value);
                            }
                          },
                          /* icon: Icon(controller.isAnimating
                                            ? Icons.pause
                                            : Icons.play_arrow),
                                        label: Text(
                                            controller.isAnimating ? "Pause" : "Play") */
                        ),
                        controller.isAnimating
                            ? Container()
                            : FlatButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.restore),
                                label: Text("Reiniciar"),
                              )
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
