import 'dart:async';

import 'package:app_dez_e_faixa/app/pages/nova_pelada/widget/widget_countdown_pelada.dart';
import 'package:flutter/material.dart';

class WidgetDialogPelada extends StatelessWidget {
  const WidgetDialogPelada({
    Key key,
    @required this.widget,
    this.controller,
  }) : super(key: key);

  final WidgetCountDownPelada widget;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(80),
        child: Container(
          height: 300,
          margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
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
                          padding: const EdgeInsets.only(top: 8.0, bottom: 5),
                          child: Center(
                              child: Text(
                            //"${widget.controle.resultado}",
                            "${widget.controllerPartida.partida.msgGanhador}",
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
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              botaoRevanche(context),
                              botaoFimPartida(context),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
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
            Color(0xFF296e19),
            Color(0xFF74c961),
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

  RaisedButton botaoRevanche(context) {
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
              Color(0xFF296e19),
              Color(0xFF74c961),
            ],
          ),
        ),
        child: const Text('Jogar Novamente',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            )),
      ),
    );
  }

  RaisedButton botaoFimPartida(context) {
    return RaisedButton(
      onPressed: () {
        widget.controllerPartida.reiniciarPlacar();
        controller.reset();
        Navigator.pop(context);
        Navigator.pop(context);
        Timer(Duration(milliseconds: 100),
            () => widget.controllerPartida.finalizarPartida());
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      padding: EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF296e19),
              Color(0xFF74c961),
            ],
          ),
        ),
        child: const Text('Terminar Partida',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            )),
      ),
    );
  }
}
