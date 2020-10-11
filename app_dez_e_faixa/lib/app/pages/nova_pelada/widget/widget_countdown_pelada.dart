import 'dart:math' as math;

import 'package:flutter/material.dart';

class WidgetCountDownPelada extends StatefulWidget {
  @override
  _WidgetCountDownPeladaState createState() => _WidgetCountDownPeladaState();
}

class _WidgetCountDownPeladaState extends State<WidgetCountDownPelada>
    with TickerProviderStateMixin {
  AnimationController controller;
  Icon _icon;

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
      shadowColor: Colors.transparent,
      child: Container(
        width: 200,
        child: Column(
          children: [
            SizedBox(
              height: 200,
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
                                                fontSize: 70.0,
                                                color: Colors.white),
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
                      ],
                    );
                  }),
            ),
            Expanded(
              flex: 1,
              child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Container(
                      width: 145,
                      // color: Colors.black,
                      child: controller.isAnimating
                          ? Column(
                              children: [
                                Expanded(
                                  child: Align(
                                    child: Container(
                                      height: 40,
                                      child: FloatingActionButton.extended(
                                          onPressed: () {
                                            if (controller.isAnimating) {
                                              controller.stop();
                                              animando(false);
                                            }
                                          },
                                          icon: _icon,
                                          label: Text("Parô!")),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(bottom: 10, top: 10),
                                      child: FloatingActionButton.extended(
                                          isExtended: true,
                                          onPressed: () {
                                            animando(true);
                                            controller.reverse(
                                                from: controller.value == 0.0
                                                    ? 1.0
                                                    : controller.value);
                                          },
                                          icon: Icon(Icons.play_arrow),
                                          label: Text("Jogar")),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: 120,
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      child: FloatingActionButton.extended(
                                          onPressed: () {
                                            controller.reset();
                                          },
                                          icon: Icon(
                                              Icons.settings_backup_restore),
                                          label: Text("Reiniciar")),
                                    ),
                                  ),
                                ]),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  animando(bool animando) {
    if (controller.isCompleted) {}
    if (animando) {
      setState(() {
        _icon = Icon(Icons.pause);
      });
    } else {
      setState(() {
        _icon = Icon(Icons.play_arrow);
      });
    }
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
