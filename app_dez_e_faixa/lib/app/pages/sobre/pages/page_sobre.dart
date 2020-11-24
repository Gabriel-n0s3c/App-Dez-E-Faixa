import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PageSobre extends StatefulWidget {
  @override
  _PageSobreState createState() => _PageSobreState();
}

class _PageSobreState extends State<PageSobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body:
            conteudo() /* ContactUs(
        cardColor: Colors.white,
        textColor: Colors.black,
        logo: AssetImage('assets/soccer.png'),
        email: 'gabriel.marques.o.silva@gmail.com',
        companyName: 'Gabriel Marques',
        companyColor: Colors.black,
        githubUserName: 'AbhishekDoshi26',
        tagLine: '© Gabriel Marques - 2020',
        taglineColor: Colors.black,
        instagram: '_abhishek_doshi',
      ), */
        );
  }

  conteudo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Color(0xFF05500A),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.0,
                  ),
                  Text(
                    "Dez & Faixa",
                    style: GoogleFonts.pacifico(
                        textStyle: TextStyle(
                      fontSize: 40.0,
                      color: Color(0xffaae3a6),
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  Divider(
                    color: Color(0xffaae3a6),
                    thickness: 2,
                    indent: 50.0,
                    endIndent: 50.0,
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 11,
                child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        cardsSobre(
                          "Email",
                          "mailto:bnb.solucoes.inteligentes@gmail.com",
                          Icon(
                            Typicons.mail,
                            color: Colors.black87,
                          ),
                        ),
                        cardsSobre(
                          "Instagram",
                          "https://instagram.com/bnb_solucoes",
                          Icon(
                            Typicons.social_instagram,
                            color: Colors.black87,
                          ),
                        ),
                        cardsSobre(
                            "Patrocinadores",
                            "https://linktr.ee/appdezefaixa",
                            Icon(
                              Icons.monetization_on,
                              color: Colors.black87,
                            )),
                        Card(
                          margin: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 25.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          color: Colors.white,
                          child: ListTile(
                            leading: Icon(Typicons.message),
                            title: Text(
                              "Sobre o App",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                        title: Text("Eai galera"),
                                        content: Container(
                                            height: 200,
                                            width: 300,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    'Este App foi desenvolvido para tornar nossas partidas mais interessantes, afinal por quê usar apensa um cronômetro se podemos ir além?',
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'O aplicativo não foi postado em nenhuma loja de aplicativos ainda porque não tenho dinheiro para posta-lo! :(',
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                        'Entre em contato caso encontre algum problema no app, ou queira ajudar o desenvolvedor!',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                  ),
                                                  Text(
                                                    '',
                                                  )
                                                ],
                                              ),
                                            )));
                                  });
                            },
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 25.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          color: Colors.white,
                          child: ListTile(
                            leading: Icon(
                              Icons.attach_money,
                              color: Colors.black87,
                            ),
                            title: Text(
                              "Apoie o desenvolvedor",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                        title: Text("Apoie o trabalho"),
                                        content: Container(
                                            height: 200,
                                            width: 300,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    'Para apoiar esse desenvolvedor entre em contato por email. Sua ajuda pode ser em dinheiro ou apenas um feedback. Também pode estar apoiando o desenvolvedor anunciando dentro do app.',
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ],
                                              ),
                                            )));
                                  });
                            },
                          ),
                        ),
                      ],
                    ))),
            Expanded(
              child: Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    color: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Text('© Gabriel Marques - ${DateTime.now().year}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffaae3a6),
                            fontSize: 20,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 1.0,
                                color: Color.fromARGB(100, 0, 0, 0),
                              ),
                            ])),
                    onPressed: () {
                      launch('mailto: ');
                    },
                  ),
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  Card cardsSobre(String nome, String url, Icon icone) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 25.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      color: Colors.white,
      child: ListTile(
        leading: icone,
        title: Text(
          nome,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onTap: () {
          launch(url);
        },
      ),
    );
  }
}
