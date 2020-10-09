//import 'package:app_dez_e_faixa/app/pages/partida_rapida/controller/controller_partida_rapida.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PlacarPartidaRapida extends StatelessWidget {
  PlacarPartidaRapida({this.controller});
  @required
  var controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        //COLUNA QUE ALINHA O PLACAR AOS TIMES
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            placarPartida(),
            //CONTAINER QUE SEPARA O PLACAR DA SECÇÃO DOS TIMES
            Container(
              padding: EdgeInsets.only(bottom: 2),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Stack(children: [
                  Row(
                    children: [
                      //TIME DA ESQUERDA
                      timeEsquerda(),
                      Padding(
                        padding: EdgeInsets.all(1),
                      ),
                      //TIME DA DIREITA
                      timeDireita(),
                    ],
                  ),
                  meioCampo(),
                ]),
              ),
            ),
          ],
        ));
  }

  Center meioCampo() {
    return Center(
        child: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 22,
      child: CircleAvatar(
        backgroundColor: Colors.lightGreen,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 3,
        ),
      ),
    ));
  }

  Expanded timeDireita() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.lightGreen,
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: 1,
                        backgroundColor: Colors.white,
                        child: ImageIcon(
                          Image.asset("assets/soccer.png").image,
                          size: 100,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          controller.somarPlacar2();
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  timeEsquerda() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.lightGreen,
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //CONTEUDO DO TIME DA ESQUERDA

              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: ImageIcon(
                          Image.asset("assets/soccer.png").image,
                          size: 100,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          controller.somarPlacar1();
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded placarPartida() {
    return Expanded(
      flex: 3,
      child: Container(
        color: Colors.grey[400],
        child: Center(
          //LINHA DO PLACAR
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(child: Observer(
                      builder: (_) {
                        return Text("${controller.placarTime1}");
                      },
                    )),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "${controller.nomeTime1}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)),
                  color: Colors.black,
                  onPressed: () {
                    controller.reiniciarPlacar();
                  },
                  child: Icon(
                    Icons.settings_backup_restore,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(child: Observer(
                        builder: (_) {
                          return Text("${controller.placarTime2}");
                        },
                      )),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "${controller.nomeTime2}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  RaisedButton buildRaisedButton() {
    return RaisedButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0a571f), Color(0xff6bd688)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          constraints: BoxConstraints(maxWidth: 300.0, maxHeight: 50.0),
          alignment: Alignment.center,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Gool!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: ImageIcon(
                Image.asset("assets/soccer.png").image,
                size: 100,
                color: Colors.black,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
