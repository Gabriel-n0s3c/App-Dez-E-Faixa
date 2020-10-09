import 'package:app_dez_e_faixa/app/pages/partida_rapida/controller/controller_partida_rapida.dart';
import 'package:app_dez_e_faixa/app/pages/partida_rapida/widget/widget_countdown_partida_rapida.dart';
import 'package:app_dez_e_faixa/app/pages/partida_rapida/widget/widget_placar_partidaRapida.dart';
import 'package:flutter/material.dart';

class PartidaRapida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ControllerPartidaRapida controller =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white10,
      //Coluna para alinhar o cronometro e o placar
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 15),
              //Cronometro
              child: CountDownTimer(
                controle: controller,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            //Exibir times e placar
            child: PlacarPartidaRapida(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
