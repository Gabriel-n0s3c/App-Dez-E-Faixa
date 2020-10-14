import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_listar_times_pelada.dart';
import 'package:app_dez_e_faixa/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class WidgetRaisedButtonJogar extends StatelessWidget {
  const WidgetRaisedButtonJogar({
    Key key,
    this.controller,
  }) : super(key: key);

  final ControllerListarTimesPelada controller;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _dialogSelecionarTimes(context);
      },
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
    );
  }

  _dialogSelecionarTimes(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Selecione os 2 times! "),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    if (controller.timesSelecionados.length == 2) {
                      Navigator.of(context).pushNamed(AppRoutes.PARTIDA_PELADA,
                          arguments: controller);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Selecione 2 Times!"),
                          );
                        },
                      );
                    }
                  },
                  child: Text("ok")),
            ],
            content: Observer(
              builder: (_) {
                return Container(
                  height: 500,
                  width: 200,
                  child: ListView.builder(
                      itemCount: controller.times.length,
                      itemBuilder: (_, index) {
                        var item = controller.times[index];
                        return ExpansionTile(
                            leading: Checkbox(
                              onChanged: (v) => {
                                if (item.jogadores.length <
                                    controller.configPelada.qtdPorTime)
                                  {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            actions: [
                                              FlatButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: Text("Ok"))
                                            ],
                                            title: Text(
                                                "O time não possui jogadores suficientes"),
                                          );
                                        })
                                  }
                                else
                                  {controller.atualizaCheckbox(item, v)}
                              },
                              value: item.isSelected == null
                                  ? false
                                  : item.isSelected,
                            ),
                            title: Text(item.nomeTime ?? " Time $index"),
                            children: List.generate(item.jogadores.length,
                                (index) => Text(item.jogadores[index].nome)));
                      }),
                );
              },
            ),
          );
        });
  }
}
