import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_selecionar_jogadores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class WidgetSelecionaItemJogador extends StatelessWidget {
  final Jogador item;
  final ControllerSelecionarJogador controller;

  const WidgetSelecionaItemJogador({Key key, this.item, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return GestureDetector(
          onTap: () => controller.atualizaCheckbox(item, !item.isSelected),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            color: item.isSelected ? Colors.green[100] : Colors.white,
            child: ListTile(
                leading: Checkbox(
                  value: item.isSelected == null ? false : item.isSelected,
                  onChanged: (value) => {
                    value != null
                        ? controller.atualizaCheckbox(item, value)
                        : print("fudeu")
                  },
                ),
                // leading: Icon(Icons.person),
                title:
                    Text(item.nome == null ? "Jogador sem nome!" : item.nome),
                trailing: Container(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [],
                  ),
                )),
          ),
        );
      },
    );
  }
}
