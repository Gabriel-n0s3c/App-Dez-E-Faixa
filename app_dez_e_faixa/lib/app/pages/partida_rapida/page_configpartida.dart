import 'package:app_dez_e_faixa/app/pages/partida_rapida/controller/controller_partida_rapida.dart';
import 'package:app_dez_e_faixa/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class PageConfigurarPartidaRapida extends StatelessWidget {
  final controle = ControllerPartidaRapida();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes partida rápida"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //LABEL PARA SELECIONAR A DURAÇÃO DA PARTIDA
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('Selecione a duração das partidas.',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600))),
                    ),

                    //DROPDOWN BUTTON PARA SELECIONAR A QUANTIDADE DE MINUTOS DA PARTIDA
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: Observer(
                            builder: (_) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  value: controle.tempo,
                                  hint: Text(
                                      "Duração de cada partida                      "),
                                  iconSize: 30,
                                  isExpanded: true,
                                  icon: Icon(Icons.arrow_drop_down),
                                  onChanged: (int newValue) {
                                    controle.setTempo(newValue);
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
                      ),
                    ),

                    //LABEL PARA DEFINIR O PLACAR MÁXIMO
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text('Placar máximo',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500))),
                    ),

                    //INPUT PARA RECEBER O VALOR DE PLACAR MÁXIMO
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 65,
                        child: TextField(
                          maxLength: 2,
                          decoration: new InputDecoration(
                              hintText: "Vence com gols/pontos: ",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (value) {
                            controle.setPlacarMax(int.parse(value));
                          },
                        ),
                      ),
                    ),

                    //LABEL PARA DO CAMPO DE NOME DO TIME 1
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('Time 1',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500))),
                    ),

                    //INPUT PARA O NOME DO TIME 1
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 65,
                        child: TextField(
                          maxLength: 15,
                          decoration: new InputDecoration(
                              hintText: " Nome ${controle.nomeTime1}",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onChanged: (value) {
                            controle.setNomeTime1(value);
                          },
                        ),
                      ),
                    ),

                    //LABEL PARA O CAMPO DE NOME DO TIME 2
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('Time 2',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500))),
                    ),

                    //INPUT PARA O NOME DO TIME 2
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 65,
                        child: TextField(
                          maxLength: 15,
                          decoration: new InputDecoration(
                              hintText: " Nome ${controle.nomeTime2}",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onChanged: (value) {
                            controle.setNomeTime2(value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //BOTÃO PARA INICIAR A PARTIDA
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        controle.verifica
                            ? Navigator.of(context).pushReplacementNamed(
                                AppRoutes.PARTIDA_RAPIDA,
                                arguments: controle)
                            : showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: Text("Campos não preenchidos"),
                                      content: Text(
                                          "Preencha todos os campos corretamente!"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Ok"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ]);
                                });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
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
                          constraints:
                              BoxConstraints(maxWidth: 300.0, maxHeight: 50.0),
                          alignment: Alignment.center,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Iniciar partida!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
