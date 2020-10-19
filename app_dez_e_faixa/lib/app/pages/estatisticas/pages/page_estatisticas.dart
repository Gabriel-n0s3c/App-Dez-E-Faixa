import 'dart:async';

import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:app_dez_e_faixa/app/pages/estatisticas/controller/controller_estatisticas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PageEstatisticas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ControllerEstatisticas controller = ControllerEstatisticas();

    return Scaffold(
      appBar: AppBar(
        title: Text("Estatísticas"),
      ),
      body: _corpo(controller),
    );
  }

  _corpo(ControllerEstatisticas controller) {
    return Observer(
      builder: (_) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Center(
                child: Text(
                  "Artilheiros",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
              Expanded(
                flex: 4,
                child: Container(
                  child: _containerArtilheiros(controller.artilheiros, 1),
                  // ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(height: 5, color: Colors.black38),
              ),
              Expanded(
                  child: Center(
                child: Text(
                  "Assistencias",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
              Expanded(
                flex: 4,
                child: Container(
                  child: _containerArtilheiros(controller.artilheiros, 2),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _containerArtilheiros(List<Jogador> controller, int golAssistencia) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            // decoration: BoxDecoration(
            //     border: Border.all(
            //   color: Colors.black,
            // )),
            child: DataTable(
                sortAscending: false,
                sortColumnIndex: 2,
                columns: <DataColumn>[
                  DataColumn(
                      label: Text(
                    "Posição",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
                  DataColumn(
                      label: Text(
                    "Nome",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
                  DataColumn(
                      label: Text(
                        golAssistencia == 1 ? "Gols" : "Assistencias",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      numeric: true,
                      onSort: (a, descending) {}),
                ],
                rows: List<DataRow>.generate(controller.length, (index) {
                  return DataRow(
                    selected: index % 2 == 0 ? true : false,
                    cells: <DataCell>[
                      DataCell(Text(
                        "${index + 1}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )),
                      DataCell(Text(
                        controller[index].nome,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )),
                      DataCell(Text(
                        golAssistencia == 1
                            ? "${controller[index].gols}"
                            : "${controller[index].assistencias}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )),
                    ],
                  );
                })),
          ),
        ),
      ),
    );
  }
}
