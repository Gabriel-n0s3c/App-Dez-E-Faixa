import 'package:app_dez_e_faixa/app/routes/app_routes.dart';
import 'package:app_dez_e_faixa/app/widgets/widget_cards.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Container(
              color: Color(0xFF05500A),
              child: header,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: grid,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/grafiti3.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  get content => Container(
        child: Column(
          children: <Widget>[
            header,
            grid,
          ],
        ),
      );

  get header => ListTile(
        contentPadding: EdgeInsets.only(left: 20, right: 20, top: 30),
        title: Text(
          'Bem vindo!',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        subtitle: Text(
          'Versão de testes',
          style: TextStyle(color: Colors.white),
        ),
        trailing: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.person,
            color: Colors.black87,
          ),
          /* Image.asset("assets/soccer.png",
          color: Colors.amber, )*/
        ),
      );

  get grid => Container(
        padding: EdgeInsets.only(left: 10, right: 7, bottom: 16),
        child: GridView.count(
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            crossAxisCount: 2,
            childAspectRatio: .95,
            children: <Widget>[
              Cards(
                rota: AppRoutes.CONFIG_PARTIDA_RAPIDA,
                nomeCard: "PARTIDA RÁPIDA",
                icone: "soccer.png",
                enabled: true,
              ),
              Cards(
                rota: AppRoutes.CONFIG_PARTIDA_RAPIDA,
                nomeCard: "OPÇÕES",
                icone: "definicoes.png",
                enabled: true,
              ),
              Cards(
                rota: AppRoutes.LISTAR_JOGADORES_PELADA,
                nomeCard: "NOVA  PELADA",
                icone: "campo.png",
                enabled: false,
              ),
              Cards(
                rota: AppRoutes.LISTAR_JOGADORES,
                nomeCard: "JOGADORES",
                icone: "jogadores.png",
                enabled: false,
              ),
              Cards(
                rota: AppRoutes.CONFIG_PARTIDA_RAPIDA,
                nomeCard: "ESTATÍSTICAS",
                icone: "lucros.png",
                enabled: false,
              ),
            ]),
      );
}
