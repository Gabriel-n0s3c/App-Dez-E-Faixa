import 'dart:math' as math;

import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_partida_pelada.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class WidgetCountDownPelada extends StatefulWidget {
  const WidgetCountDownPelada({Key key, this.controllerPartida})
      : super(key: key);

  @override
  _WidgetCountDownPeladaState createState() => _WidgetCountDownPeladaState();
  final ControllerPartidaPelada controllerPartida;
}

class _WidgetCountDownPeladaState extends State<WidgetCountDownPelada>
    with TickerProviderStateMixin {
  AnimationController controller;
  Icon _icon;

  _WidgetCountDownPeladaState();

  String get timerString {
    Duration duration = controller.duration * controller.value;
    int tempoMili = duration.inMilliseconds;
    if (tempoMili > 0 && tempoMili <= 100) {
      widget.controllerPartida.verificarGanhador(t: 1);
    }
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    autorun((_) => widget.controllerPartida.exibirMensagem ? _dialog() : null);

    controller = AnimationController(
      vsync: this,
      duration:
          Duration(seconds: widget.controllerPartida.partida.tempoInSeconds),
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

  _dialog() async {
    await Future.delayed(Duration(milliseconds: 50));
    //controller.stop();
    animando(false);
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(80),
            child: Container(
              height: 300,
              margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: SizedBox.expand(
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 5),
                              child: Center(
                                  child: Text(
                                //"${widget.controle.resultado}",
                                "${widget.controllerPartida.partida.ganhador}",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              )),
                            ),
                            placarDialog(),
                          ],
                        ),
                      ),
                      estatisticasDosTimes(),
                      Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: botaoRevanche()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  Expanded estatisticasDosTimes() {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Text(
            //"${widget.controle.ganhador}",
            "Estatísticas dos times",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            child: Container(
              color: Colors.white.withOpacity(0.3),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //INFORMAÇÕES TIME 1
                  informacoesTime1(),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Gols marcados",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  informacoesTime2(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container informacoesTime1() {
    return Container(
      child: Column(
        children: [
          Text(
            " ${widget.controllerPartida.partida.placarTime1}",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Container informacoesTime2() {
    return Container(
      child: Column(
        children: [
          Text(
            " ${widget.controllerPartida.partida.placarTime2}",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Container placarDialog() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF0D47A1),
            Color(0xFF1976D2),
            Color(0xFF42A5F5),
          ],
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "${widget.controllerPartida.time1.nomeTime}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "${widget.controllerPartida.partida.placarTime1}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Text(
              "X",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 15, left: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "${widget.controllerPartida.partida.placarTime2}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "${widget.controllerPartida.time2.nomeTime}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  RaisedButton botaoRevanche() {
    return RaisedButton(
      onPressed: () {
        widget.controllerPartida.reiniciarPlacar();
        controller.reset();
        Navigator.pop(context);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      padding: EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        child: const Text('Revanche',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            )),
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
