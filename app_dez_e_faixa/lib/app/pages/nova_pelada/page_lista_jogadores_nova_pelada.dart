import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:app_dez_e_faixa/app/provider/controller_global_jogador.dart';
import 'package:app_dez_e_faixa/app/routes/app_routes.dart';
import 'package:app_dez_e_faixa/app/widgets/widget_item_lista_jogador.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PageListaJogadoresNovaPelada extends StatefulWidget {
  @override
  _PageListaJogadoresNovaPeladaState createState() =>
      _PageListaJogadoresNovaPeladaState();
}

class _PageListaJogadoresNovaPeladaState
    extends State<PageListaJogadoresNovaPelada> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ControllerGlobalJogador>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogadores Cadastrados"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _novoJogador(controller),
          )
        ],
      ),
      body: Observer(builder: (_) {
        return controller.getSize() == 0
            ? Center(child: Text("Nenhum jogador cadastrado!"))
            : ListView.builder(
                itemCount: controller.getSize(),
                itemBuilder: (_, index) {
                  var item = controller.listaJogadores[index];
                  return WidgetItemListaJogador(
                    item: item,
                    controller: controller,
                  );
                },
              );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: () => Navigator.of(context)
            .pushNamed(AppRoutes.SELECIONAR_JOGADORES, arguments: controller),
      ),
    );
  }

  _novoJogador(controller) {
    var model = Jogador();

    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Cadastrar Jogador"),
            content: TextField(
              maxLength: 15,
              onChanged: model.setNome,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Novo Jogador',
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () {
                  if (model.nome.length < 3 || model.nome == "") {
                    nomeInvalido();
                  } else {
                    controller.addJogador(model);
                    Navigator.pop(context);
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          );
        });
  }

  nomeInvalido() {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("O nome inserido não é valido!"),
          );
        });
  }
}
