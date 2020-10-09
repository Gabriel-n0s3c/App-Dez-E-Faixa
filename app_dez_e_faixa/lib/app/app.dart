import 'package:app_dez_e_faixa/app/pages/jogadores/page_form_jogador.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/page_config_pelada.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/page_definir_times.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/page_lista_jogadores_nova_pelada.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/page_listar_times.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/page_selecionar_jogadores.dart';
import 'package:app_dez_e_faixa/app/pages/partida_rapida/page_configpartida.dart';
import 'package:app_dez_e_faixa/app/pages/page_homepage.dart';
import 'package:app_dez_e_faixa/app/pages/jogadores/page_lista_jogadores.dart';
import 'package:app_dez_e_faixa/app/pages/partida_rapida/page_partidarapida.dart';
import 'package:app_dez_e_faixa/app/provider/controller_global_jogador.dart';
import 'package:app_dez_e_faixa/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ControllerGlobalJogador>(
          create: (_) => ControllerGlobalJogador(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Dez e Faixa - v1",
        theme: ThemeData(
          primarySwatch: createMaterialColor(Color(0xFF05500a)),
        ),
        routes: {
          AppRoutes.HOME: (_) => PaginaInicial(),
          AppRoutes.CONFIG_PARTIDA_RAPIDA: (_) => PageConfigurarPartidaRapida(),
          AppRoutes.PARTIDA_RAPIDA: (_) => PartidaRapida(),
          AppRoutes.LISTAR_JOGADORES: (_) => PageListaJogadores(),
          AppRoutes.FORM_JOGADOR: (_) => PageFormJogador(),
          AppRoutes.LISTAR_JOGADORES_PELADA: (_) =>
              PageListaJogadoresNovaPelada(),
          AppRoutes.SELECIONAR_JOGADORES: (_) => PageSelecionarJogadores(),
          AppRoutes.CONFIG_PELADA: (_) => PageConfigPelada(),
          AppRoutes.DEFINIR_TIMES: (_) => PageDefinirTimes(),
          AppRoutes.LISTAR_TIMES: (_) => PageListaTimes(),
        },
      ),
    );
  }

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
