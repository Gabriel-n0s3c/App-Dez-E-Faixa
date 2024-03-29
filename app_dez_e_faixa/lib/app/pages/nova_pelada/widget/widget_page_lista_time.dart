import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:app_dez_e_faixa/app/model/time.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_listar_times_pelada.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/widget/widget_raised_button_jogar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetPageListaTime extends StatelessWidget {
  final ControllerListarTimesPelada controller;

  @override
  const WidgetPageListaTime({Key key, this.controller}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/fundocampometade1.png",
            ),
            fit: BoxFit.cover,
            alignment: Alignment.bottomRight),
      ),
      child: Observer(builder: (_) {
        return controller.timesSelecionados == null
            ? Container(
                child: Center(child: Text("Carregando...")),
              )
            : Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: GridView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: controller.getSize,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.75),
                      itemBuilder: (_, indexTime) {
                        var item = controller.times[indexTime];
                        return cadaTimeGrid(
                            controller, indexTime, item, context);
                      },
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 0),
                        child: WidgetRaisedButtonJogar(
                          controller: controller,
                        ),
                      ),
                    ),
                  )
                ],
              );
      }),
    );
  }

  cadaTimeGrid(ControllerListarTimesPelada controller, int indexTime, Time item,
      context) {
    return Container(
      child: Observer(
        builder: (_) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            elevation: 5,
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              item.nomeTime == null
                                  ? "Time ${indexTime + 1}"
                                  : "${item.nomeTime}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: PopupMenuButton(
                            tooltip: "Opções",
                            icon: Icon(Icons.more_vert),
                            onSelected: (a) {
                              a == 1
                                  ? controller.removerTime(indexTime)
                                  : _alterarNomeTime(
                                      context: context,
                                      controller: controller,
                                      indexTime: indexTime);
                            },
                            itemBuilder: (_) => [
                              PopupMenuItem(
                                child: Text("Excluir Time"),
                                value: 1,
                              ),
                              PopupMenuItem(
                                child: Text("Alterar Nome"),
                                value: 2,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Stack(children: [
                      ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: ListView.builder(
                            physics: ScrollPhysics(),
                            itemCount: item.jogadores.length,
                            itemBuilder: (_, index) {
                              var jogador = item.jogadores[index];

                              return _jogadorCardTime(index, jogador, context,
                                  indexTime, controller);
                            }),
                      ),
                    ]),
                  ),
                  item.jogadores.length < controller.configPelada.qtdPorTime
                      ? Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, bottom: 5),
                              child: CircleAvatar(
                                maxRadius: 17,
                                minRadius: 15,
                                backgroundColor: Colors.lightGreen,
                                child: IconButton(
                                  padding: EdgeInsets.all(0),
                                  splashColor: Colors.green,
                                  icon: Icon(Icons.add),
                                  onPressed: () => _adicionarJogador(
                                      context, controller, indexTime),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _jogadorCardTime(
    int index,
    Jogador jogador,
    context,
    int indexTime,
    ControllerListarTimesPelada controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Observer(builder: (_) {
              return Text("${index + 1} - " + jogador.nome.toUpperCase(),
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  )));
            }),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                tooltip: "Exlcuir jogador",
                icon: Icon(
                  Icons.cancel,
                  color: Colors.orange,
                  size: 19,
                ),
                onPressed: () {
                  _removerJogador(context, jogador, indexTime, controller);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _alterarNomeTime(
      {context, indexTime, ControllerListarTimesPelada controller}) {
    Time time = Time();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Alterar nome do Time"),
            content: TextField(
              maxLength: 15,
              onChanged: time.setNomeTime,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Novo nome',
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => {
                  Navigator.pop(context),
                },
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () => {
                  if (time.nomeTime.length < 2 || time.nomeTime == "")
                    {
                      nomeInvalido(context),
                    }
                  else
                    {
                      controller.setNomeTime(
                        value: time.nomeTime,
                        index: indexTime,
                      ),
                      Navigator.pop(context),
                    }
                },
                child: Text('Salvar'),
              ),
            ],
          );
        });
  }

  _removerJogador(
      context, Jogador j, int index, ControllerListarTimesPelada controller) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Deseja remover este jogador do time? "),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () => {
                        controller.removeJogador(j, index),
                        Navigator.pop(context),
                      },
                  child: Text("Remover")),
            ],
          );
        });
  }

  _adicionarJogador(
      context, ControllerListarTimesPelada controller, int indexTime) {
    Jogador model = Jogador();
    model.isSelected = null;
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: Duration(milliseconds: 500),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment(0.7, -0.70),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(80),
            child: Container(
              height: 300,
              margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Center(
                                  child: Text("Jogadores fora da pelada!"))),
                          Expanded(
                            flex: 10,
                            child: ListView.builder(
                                itemCount: controller.configPelada
                                    .selecionarJogador.naoSelecionados.length,
                                itemBuilder: (_, index) {
                                  var item = controller.configPelada
                                      .selecionarJogador.naoSelecionados[index];
                                  return ListTile(
                                    title: Text(item.nome),
                                    trailing: Container(
                                      width: 50,
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.add,
                                            ),
                                            onPressed: () => {
                                              controller.addJogador(
                                                  item, indexTime),
                                              Navigator.pop(context),
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextField(
                                maxLength: 15,
                                onChanged: model.setNome,
                                decoration: InputDecoration(
                                  labelText: 'Novo Jogador',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: CircleAvatar(
                            child: IconButton(
                                icon: Icon(Icons.arrow_forward_ios),
                                onPressed: () => {
                                      if (model.nome.length < 3 ||
                                          model.nome == "")
                                        {
                                          nomeInvalido(context),
                                        }
                                      else
                                        {
                                          controller.addJogador(
                                              model, indexTime),
                                          Navigator.pop(context),
                                        }
                                    }),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}

nomeInvalido(context) {
  return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("O nome inserido não é valido!"),
        );
      });
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
