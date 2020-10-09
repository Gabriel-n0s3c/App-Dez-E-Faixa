import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_selecionar_jogadores.dart';
import 'package:app_dez_e_faixa/app/provider/controller_global_jogador.dart';
import 'package:app_dez_e_faixa/app/routes/app_routes.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/widget/widget_selecionar_item_lista_jogador.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PageSelecionarJogadores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ControllerSelecionarJogador controller = ControllerSelecionarJogador(
        global: Provider.of<ControllerGlobalJogador>(context));

    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text(controller.selecionados.length == 0
              ? " Selecione os jogadores"
              : "${controller.selecionados.length} Selecione os jogadores");
        }),
        actions: [
          IconButton(
            tooltip: "Selecionar todos ",
            icon: Icon(Icons.select_all),
            onPressed: () => controller.selecionarTodos(),
          )
        ],
      ),
      body: Observer(builder: (_) {
        return Column(children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Pesquisar',
            ),
            onChanged: (value) => controller.filtrar(value),
          ),
          Expanded(
            child: controller.filtrada.length == 0
                ? Center(child: Text("Nenhum jogador cadastrado!"))
                : ListView.builder(
                    itemCount: controller.filtrada.length,
                    itemBuilder: (_, index) {
                      var item = controller.filtrada[index];
                      return WidgetSelecionaItemJogador(
                        item: item,
                        controller: controller,
                      );
                    },
                  ),
          ),
        ]);
      }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.forward),
          onPressed: () => {
                controller.selecionados.length <= 1
                    ? showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Quantidade de jogadores inválida!"),
                            content: Text(
                                "Selecione no mínimo dois jogadores para formarem os times!"),
                            actions: [
                              FloatingActionButton(
                                child: Text("OK"),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          );
                        },
                      )
                    : Navigator.of(context).pushNamed(AppRoutes.CONFIG_PELADA,
                        arguments: controller)
              }),
    );
  }
}
