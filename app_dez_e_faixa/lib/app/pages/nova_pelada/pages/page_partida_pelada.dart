import 'package:app_dez_e_faixa/app/model/time.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_partida_pelada.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/widget/widget_countdown_pelada.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
              containerSuperiorPlacarETempo(controllerPartidaPelada),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black26,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            icon: ImageIcon(
                              Image.asset("assets/soccer.png").image,
                              size: 50,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              controllerPartidaPelada.golTime1();
                            },
                          ),
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
                            controllerPartidaPelada.reiniciarPlacar();
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
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              padding: EdgeInsets.all(0),
                              icon: ImageIcon(
                                Image.asset("assets/soccer.png").image,
                                size: 50,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                controllerPartidaPelada.golTime2();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                height: 5,
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.black,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: listarTime(
                          controllerPartidaPelada.time1,
                          controllerPartidaPelada,
                          1,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 2, right: 2)),
                      Expanded(
                        flex: 1,
                        child: listarTime(
                          controllerPartidaPelada.time2,
                          controllerPartidaPelada,
                          2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                height: 5,
              ),
              Expanded(
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container listarTime(Time time, ControllerPartidaPelada controller, int t) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        separatorBuilder: (_, index) => Divider(
          color: Colors.black,
        ),
        itemCount: time.jogadores.length,
        itemBuilder: (_, index) {
          var jogador = time.jogadores[index];
          return ListTile(
            hoverColor: Colors.green,
            title: Text(
              jogador.nome.toUpperCase(),
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
              left: 10,
              top: 0,
              bottom: 0,
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Wrap(
                spacing: 10,
                children: [
                  SizedBox(
                    width: 20,
                    child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: ImageIcon(
                          Image.asset("assets/soccer.png").image,
                          size: 20,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          controller.golJogador(time: t, jogador: jogador);
                        }),
                  ),
                  SizedBox(
                    width: 25,
                    child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: ImageIcon(
                          Image.asset("assets/chuteira.png").image,
                          size: 50,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          controller.assistenciaJogador(jogador: jogador);
                        }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Expanded containerSuperiorPlacarETempo(ControllerPartidaPelada controller) {
    return Expanded(
      flex: 6,
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Observer(builder: (_) {
                    return Container(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${controller.partida.placarTime1}",
                                          style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                                fontSize: 70,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Text("${controller.time1.nomeTime}",
                                            style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500))),
                                      ],
                                    ),
                                  ),
                                ),
                                /* Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        controller.partida.golTime1();
                                      },
                                      backgroundColor: Colors.white,
                                      child: ImageIcon(
                                        Image.asset("assets/soccer.png").image,
                                        size: 50,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ), */
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
                    );
                  }),
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
                                  child: Observer(builder: (_) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${controller.partida.placarTime2}",
                                          style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                                fontSize: 70,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Text("${controller.time2.nomeTime}",
                                            style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500))),
                                      ],
                                    );
                                  }),
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
              child: WidgetCountDownPelada(controllerPartida: controller),
            ),
          ],
        ),
      ),
    );
  }
}
