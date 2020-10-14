import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_listar_times_pelada.dart';
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
        title: Text("Lista de times "),
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
          Container(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: controllerPage,
        builder: (context, child) {
          return BottomNavigationBar(
            currentIndex: controllerPage?.page?.round() ?? 0,
            backgroundColor: Colors.white,
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
