import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_config_pelada.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_selecionar_jogadores.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/widget/widget_form_config_pelada.dart';
import 'package:app_dez_e_faixa/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class PageConfigPelada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ControllerSelecionarJogador controllerNovaPelada =
        ModalRoute.of(context).settings.arguments;

    ControllerConfigPelada controller =
        ControllerConfigPelada(selecionarJogador: controllerNovaPelada);

    final focus1 = FocusNode();

    TextEditingController txt = TextEditingController();
    TextEditingController txt1 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes partida rápida"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: WidgetFormConfigPelada(
                controller: controller,
                txt: txt,
                txt1: txt1,
                focus1: focus1,
              ),
            ),
            //BOTÃO PARA INICIAR A PARTIDA
            Expanded(
              child: botaoEnviaFormPelada(controller, context),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }

  Container botaoEnviaFormPelada(
      ControllerConfigPelada controller, BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              if (controller.verifica()) {
                controller.definirTimes == 1
                    ? Navigator.of(context).pushNamed(AppRoutes.LISTAR_TIMES,
                        arguments: controller)
                    : Navigator.of(context).pushNamed(AppRoutes.DEFINIR_TIMES);
              } else {
                _dialog(context);
              }
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
                constraints: BoxConstraints(maxWidth: 300.0, maxHeight: 50.0),
                alignment: Alignment.center,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
    );
  }

  _dialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            FloatingActionButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
          title: Text("Campos não preenchidos"),
          content: Text("Preencha todos os campos corretamente!"),
        );
      },
    );
  }
}
