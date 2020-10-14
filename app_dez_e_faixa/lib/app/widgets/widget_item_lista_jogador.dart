import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetItemListaJogador extends StatelessWidget {
  WidgetItemListaJogador({this.item, this.controller});

  final Jogador item;

  @required
  final controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
            leading: Icon(Icons.person),
            title: Text(item.nome == null ? "Jogador sem nome!" : item.nome),
            trailing: Container(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      size: 20,
                      color: Colors.black,
                    ),
                    onPressed: () => _exibirCarta(context, item),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.black,
                    ),
                    onPressed: () => _alterarJogador(context, item),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      size: 20,
                      color: Colors.black,
                    ),
                    onPressed: () => _confirmaExclusao(context, item),
                  ),
                ],
              ),
            ));
      },
    );
  }

  _alterarJogador(context, item) {
    Jogador j = item;
    var txt = TextEditingController();
    j.nome == null ? txt.text = "Novo nome" : txt.text = j.nome;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Alterar jogador"),
              content: TextField(
                controller: txt,
                maxLength: 20,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                    child: Text("Salvar"),
                    onPressed: () {
                      j.setNome(txt.text);
                      controller.atualizarJogador(j);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  _confirmaExclusao(context, Jogador item) {
    Jogador j = item;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Excluir Jogador"),
          content: Text("Confirma a exclusão do jogador"),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Excluir"),
              onPressed: () {
                controller.excluirJogador(j);
                Navigator.of(context).pop();
              },
            )
          ], //widget
        );
      },
    );
  }

  _exibirCarta(context, Jogador item) {
    //controller.stop();
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: Duration(milliseconds: 500),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(80),
            child: Container(
              height: 300,
              margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(40),
              ),
              child: SizedBox.expand(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/cardmini1.png",
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 70,
                        left: 100,
                        child: Text(
                          "85",
                          style: GoogleFonts.barlowCondensed(
                            textStyle: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFedd21f),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 110,
                        left: 110,
                        child: Text(
                          "CM",
                          style: GoogleFonts.barlowCondensed(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Color(0xFFedd21f),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 160,
                        width: 60,
                        left: 90,
                        child: Image.asset("assets/emblema_time.png"),
                      ),
                      Positioned(
                          top: 110,
                          left: 170,
                          width: 100,
                          child: Image.asset(
                            "assets/jogador.png",
                          )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 52.0),
                          child: Text(
                            "${item.nome.toUpperCase()}",
                            style: GoogleFonts.barlowCondensed(
                              textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFedd21f),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Positioned(child: null),
                    ],
                  ),
                ),
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
