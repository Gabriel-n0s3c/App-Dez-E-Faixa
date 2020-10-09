import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:app_dez_e_faixa/app/pages/jogadores/controller/controller_page_lista_jogadores.dart';
import 'package:app_dez_e_faixa/app/widgets/widget_item_lista_jogador.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PageListaJogadores extends StatefulWidget {
  @override
  _PageListaJogadoresState createState() => _PageListaJogadoresState();
}

class _PageListaJogadoresState extends State<PageListaJogadores> {
  final controller = ControllerPageListaJogador();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de jogadores"),
      ),
      body: Observer(builder: (_) {
        return controller.getSize() == 0
            ? Center(child: Text("Nenhum jogador cadastrado!"))
            : ListView.builder(
                itemCount: controller.getSize(),
                itemBuilder: (_, index) {
                  var item = controller.cntrlJogador.listaJogadores[index];
                  return WidgetItemListaJogador(
                    item: item,
                    controller: controller,
                  );
                },
              );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _novoJogador(),
      ),
    );
  }

  _novoJogador() {
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
                  if (model.nome.length < 3 || model.nome.isEmpty) {
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
