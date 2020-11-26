import 'package:app_dez_e_faixa/app/pages/partida_rapida/controller/controller_partida_rapida.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetFormConfigPartida extends StatelessWidget {
  WidgetFormConfigPartida({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final ControllerPartidaRapida controller;

  final TextEditingController txt = TextEditingController();
  final TextEditingController tempoPartida = TextEditingController();
  final TextEditingController txtNomeTime1 = TextEditingController();
  final TextEditingController txtNomeTime2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /* //DROPDOWN BUTTON PARA SELECIONAR A QUANTIDADE DE MINUTOS DA PARTIDA
          dropDownTempoPartida(), */

          //INPUT PARA RECEBER O VALOR DE PLACAR MÁXIMO
          textFieldTempo(),

          //INPUT PARA RECEBER O VALOR DE PLACAR MÁXIMO
          textFieldPlacarMaximo(),

          //INPUT PARA O NOME DO TIME 1
          textFieldNomeTime(1),

          //INPUT PARA O NOME DO TIME 2
          textFieldNomeTime(2),
        ],
      ),
    );
  }

  Padding textFieldTempo() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: TextField(
        autofocus: false,
        controller: tempoPartida,
        maxLength: 2,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: new InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: 'Duração da partida em minutos: ',
            labelText: "Duração da partida",
            alignLabelWithHint: false,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500))),
        onChanged: (value) {
          controller.setTempo(int.parse(value));
        },
      ),
    );
  }

  Padding textFieldNomeTime(int time) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
        controller: time == 1 ? txtNomeTime1 : txtNomeTime2,
        autofocus: false,
        maxLength: 15,
        decoration: new InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: time == 1 ? 'Time 1' : 'Time 2 ',
            labelText: time == 1 ? 'Nome time 1' : 'Nome time 2 ',
            alignLabelWithHint: false,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500))),
        onChanged: (value) {
          time == 1
              ? controller.setNomeTime1(value)
              : controller.setNomeTime2(value);
        },
      ),
    );
  }

  Padding textFieldPlacarMaximo() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
        autofocus: false,
        controller: txt,
        maxLength: 2,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: new InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: 'Vence com gol(s)/ponto(s): ',
            labelText: "Placar máximo:",
            alignLabelWithHint: false,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500))),
        onChanged: (value) {
          controller.setPlacarMax(int.parse(value));
        },
      ),
    );
  }

  Padding dropDownTempoPartida() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InputDecorator(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            labelText: "Selecione a duração da partida",
            labelStyle: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        child: Observer(
          builder: (_) {
            return DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: controller.tempo,
                hint: Text("Duração de cada partida"),
                iconSize: 30,
                isExpanded: false,
                icon: Icon(Icons.arrow_drop_down),
                onChanged: (value) {
                  controller.setTempo(value);
                },
                items: <int>[1, 2, 5, 10, 15, 30]
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                      child: Text("$value"), value: value);
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
