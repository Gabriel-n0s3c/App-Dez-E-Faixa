import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_config_pelada.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetFormConfigPelada extends StatelessWidget {
  const WidgetFormConfigPelada({
    Key key,
    @required this.controller,
    @required this.txt,
    @required this.txt1,
    @required this.focus1,
  }) : super(key: key);

  final ControllerConfigPelada controller;
  final TextEditingController txt;
  final TextEditingController txt1;
  final FocusNode focus1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //DROPDOWN BUTTON PARA SELECIONAR A QUANTIDADE DE MINUTOS DA PARTIDA
          dropDownTempoPartida(),

          //INPUT PARA RECEBER O VALOR DE PLACAR MÁXIMO
          textFieldPlacarMaximo(),

          //INPUT PARA RECEBER A QUANTIDADE DE JOGADORES POR EQUIPE
          textFieldQuantidadeJogadores(),

          //INPUT RADIO
          radioGroup(),
        ],
      ),
    );
  }

  Padding radioGroup() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Observer(
        builder: (_) {
          return Focus(
            canRequestFocus: true,
            focusNode: focus1,
            child: Container(
              child: InputDecorator(
                decoration: InputDecoration(
                    labelText: "Definir times:",
                    labelStyle: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RadioListTile(
                      selected: controller.definirTimes == 1 ? true : false,
                      title: Text("Aleatoriamente"),
                      value: 1,
                      groupValue: controller.definirTimes,
                      onChanged: (value) {
                        controller.atualizaRadioButton(value);
                      },
                    ),
                    RadioListTile(
                      selected: controller.definirTimes == 2 ? true : false,
                      title: Text("Manualmente"),
                      value: 2,
                      groupValue: controller.definirTimes,
                      onChanged: (value) {
                        controller.atualizaRadioButton(value);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding textFieldQuantidadeJogadores() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        autofocus: false,
        controller: txt1,
        maxLength: 2,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: new InputDecoration(
            hintText: "Quantidade de jogadores por time ",
            labelText: 'Quantidade de jogadores por equipe:',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        onChanged: (value) {
          controller.setQuantidadePorTime(int.parse(value));
        },
      ),
    );
  }

  Padding textFieldPlacarMaximo() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
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
          controller.setPlacarMaximo(int.parse(value));
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
