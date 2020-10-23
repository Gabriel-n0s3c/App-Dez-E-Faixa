import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageFormJogador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff05500a),
        title: Text("Jogador"),
      ),
      body: _conteudo(),
    );
  }

  _conteudo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black87,
        image: DecorationImage(
          image: AssetImage(
            "assets/card.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 10,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 80,
                                        left: 13,
                                        child: Text(
                                          "85",
                                          style: GoogleFonts.barlowCondensed(
                                            textStyle: TextStyle(
                                              fontSize: 60,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFFedd21f),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 140,
                                        left: 25,
                                        child: Text(
                                          "CM",
                                          style: GoogleFonts.barlowCondensed(
                                            textStyle: TextStyle(
                                                fontSize: 30,
                                                color: Color(0xFFedd21f),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 240,
                                        width: 80,
                                        child: Image.asset(
                                            "assets/emblema_time.png"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Container(
                            child: Padding(
                                padding: EdgeInsets.only(top: 88, right: 45),
                                child: Image.asset(
                                  "assets/jogador.png",
                                )),
                          ),
                        ),
                      ],
                    ),
                  ) /* Row(
                children: [],
              ), */
                  ),
              Expanded(
                flex: 6,
                child: Row(
                  children: [],
                ),
              ),

              /* Positioned(
              top: 75,
              left: 88,
              child: Container(
                child: Text(
                  "85",
                  style: GoogleFonts.barlowCondensed(
                    textStyle: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFedd21f),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 140,
              left: 98,
              child: Container(
                child: Text(
                  "CM",
                  style: GoogleFonts.barlowCondensed(
                    textStyle: TextStyle(
                        fontSize: 30,
                        color: Color(0xFFedd21f),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ), */
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Text(
                "NOME",
                style: GoogleFonts.barlowCondensed(
                  textStyle: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFedd21f),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
