import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_listar_times_pelada.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/widget/widget_page_historico.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/widget/widget_page_lista_time.dart';
import 'package:flutter/material.dart';

class PageListaTimes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ControllerListarTimesPelada controller = ControllerListarTimesPelada(
      configPelada: ModalRoute.of(context).settings.arguments,
    );

    final controllerPage = PageController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Pré-jogo"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => {controller.addTime(controller.times.length)},
          )
        ],
      ),
      body: PageView(
        controller: controllerPage,
        children: [
          WidgetPageListaTime(controller: controller),
          WidgetPageHistorico(controller: controller),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: controllerPage,
        builder: (context, child) {
          return BottomNavigationBar(
            currentIndex: controllerPage?.page?.round() ?? 0,
            backgroundColor: Colors.white54,
            onTap: (a) {
              controllerPage.jumpToPage(a);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                title: Text("Times"),
                icon: ImageIcon(
                  AssetImage("assets/soccer.png"),
                ),
              ),
              BottomNavigationBarItem(
                title: Text("Histórico"),
                icon: Icon(Icons.history),
              ),
            ],
          );
        },
      ),
    );
  }
}
