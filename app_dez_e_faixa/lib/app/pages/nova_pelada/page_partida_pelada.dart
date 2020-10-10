import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_listar_times_pelada.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_partida_pelada.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/widget/widget_countdown_pelada.dart';
import 'package:flutter/material.dart';

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

    return SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.amber.withOpacity(0.7),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.purpleAccent.withOpacity(0.7),
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
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.black38,
                        child: ListView.separated(
                            itemBuilder: (_, index) {
                              return Container();
                            },
                            separatorBuilder: (_, index) => Divider(
                                  color: Colors.black,
                                ),
                            itemCount: 10),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.lightBlue.withOpacity(0.7),
                        child: ListView.separated(
                            itemBuilder: (_, index) {
                              return Container();
                            },
                            separatorBuilder: (_, index) => Divider(
                                  color: Colors.black,
                                ),
                            itemCount: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
