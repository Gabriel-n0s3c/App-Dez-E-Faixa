import 'package:app_dez_e_faixa/app/model/time.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_listar_times_pelada.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_partida_pelada.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/widget/widget_countdown_pelada.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PagePartidaPelada extends StatefulWidget {
  @override
  _PagePartidaPeladaState createState() => _PagePartidaPeladaState();
}

class _PagePartidaPeladaState extends State<PagePartidaPelada> {
  @override
  Widget build(BuildContext context) {
    ControllerPartidaPelada controllerPartidaPelada = ControllerPartidaPelada(
      controllerListarTimesPelada: ModalRoute.of(context).settings.arguments,
    );

    return Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: true,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              containerSuperiorPlacarETempo(),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: listarTime(controllerPartidaPelada
                            .controllerListarTimesPelada.timesSelecionados[0]),
                      ),
                      Padding(padding: EdgeInsets.only(left: 2, right: 2)),
                      Expanded(
                        flex: 1,
                        child: listarTime(controllerPartidaPelada
                            .controllerListarTimesPelada.timesSelecionados[1]),
                      ),
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

  Container listarTime(Time time) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        separatorBuilder: (_, index) => Divider(
          color: Colors.black,
        ),
        itemCount: time.jogadores.length,
        itemBuilder: (_, index) {
          var jogador = time.jogadores[index];
          return Text(jogador.nome);
        },
      ),
    );
  }

  Expanded containerSuperiorPlacarETempo() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.7),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Align(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "0",
                                        style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                              fontSize: 70,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text("Time 1",
                                          style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.w500))),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    backgroundColor: Colors.white,
                                    child: ImageIcon(
                                      Image.asset("assets/soccer.png").image,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                              // color: Colors.whitranspte,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.7),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                              // color: Colors.whitranspte,
                              ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Align(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "0",
                                        style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                              fontSize: 70,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text("Time 1",
                                          style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.w500))),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    backgroundColor: Colors.white,
                                    child: ImageIcon(
                                      Image.asset("assets/soccer.png").image,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: WidgetCountDownPelada(),
            ),
          ],
        ),
      ),
    );
  }
}
