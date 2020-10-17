import 'package:app_dez_e_faixa/app/model/partida.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_listar_times_pelada.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class WidgetPageHistorico extends StatelessWidget {
  final ControllerListarTimesPelada controller;

  @override
  const WidgetPageHistorico({Key key, this.controller}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/fundocampometade2.png",
          ),
          fit: BoxFit.cover,
          alignment: Alignment.centerLeft,
        ),
      ),
      child: Observer(builder: (_) {
        return controller.historicoPartidas == null ||
                controller.historicoPartidas.length == 0
            ? Container(
                height: 20,
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Histórico vazio...",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(3.0, 2.0),
                              blurRadius: 2.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            )
                          ]),
                    ),
                  ),
                )),
              )
            : Container(
                child: ListView.builder(
                itemCount: controller.historicoPartidas.length,
                itemBuilder: (_, index) {
                  var partida = controller.historicoPartidas[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(5.0, 5.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(150, 0, 0, 0),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Partida ${index + 1}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        Text(
                                            "${partida.resultado} - ${partida.ganhador.nomeTime}",
                                            style: TextStyle(
                                              fontSize: 20,
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: ExpansionTile(
                                title: Text(
                                  "Detalhes",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                children: [
                                  // buildSizedBox(context, partida),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(children: [
                                        Expanded(
                                          flex: 4,
                                          child: Center(
                                              child: Text(
                                            "${partida.time1.nomeTime}",
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          )),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Center(
                                              child: Text(
                                                  "${partida.placarTime1} x ${partida.placarTime2}",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ))),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Center(
                                              child: Text(
                                                  "${partida.time2.nomeTime}",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ))),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            // List.generate(
                            //   partida.time1.jogadores.length,
                            //   (index) => Text(
                            //       partida.time1.jogadores[index].nome))
                          ]),
                    ),
                  );
                },
              ));
        // child: ,
      }),
    );
  }

  SizedBox buildSizedBox(BuildContext context, Partida item) {
    return SizedBox.expand(
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
                      "${item.msgGanhador}",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    )),
                  ),
                  placarDialog(item),
                ],
              ),
            ),
            estatisticasDosTimes(item),
          ],
        ),
      ),
    );
  }

  Expanded estatisticasDosTimes(Partida item) {
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
                  informacoesTime1(item),
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
                  informacoesTime2(item),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container informacoesTime1(Partida item) {
    return Container(
      child: Column(
        children: [
          Text(
            " ${item.placarTime1}",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Container informacoesTime2(item) {
    return Container(
      child: Column(
        children: [
          Text(
            " ${item.placarTime2}",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Container placarDialog(Partida item) {
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
                      "${item.time1.nomeTime}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "${item.placarTime1}",
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
                      "${item.placarTime2}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "${item.time2.nomeTime}",
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
}
