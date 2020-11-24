import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cards extends StatelessWidget {
  @required
  final String rota;

  @required
  final String nomeCard;

  final String icone;

  const Cards({Key key, this.rota, this.nomeCard, this.icone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {},
      onTap: () {
        Navigator.of(context).pushNamed(rota);
      },
      child: Card(
        color: Color(0xFF05500A),
        elevation: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 10,
                      ),
                      child: Text(nomeCard,
                          style: GoogleFonts.ropaSans(
                              textStyle: TextStyle(
                                  color: Color(0xFFA8FFAE),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300))),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                ],
              ),
            ),
            icone == null
                ? Container()
                : Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20, bottom: 20),
                          child: Image.asset(
                            "assets/$icone",
                            height: 70,
                            color: Color(0XFFA8FFAE),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class InfoCards extends StatelessWidget {
  @required
  final String rota;

  @required
  final String nomeCard;

  final String icone;

  const InfoCards({Key key, this.rota, this.nomeCard, this.icone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {},
      onTap: () {
        Navigator.of(context).pushNamed(rota);
      },
      child: Card(
        color: Color(0xFF05500A),
        elevation: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 10,
                      ),
                      child: Text(nomeCard,
                          style: GoogleFonts.ropaSans(
                              textStyle: TextStyle(
                                  color: Color(0xFFA8FFAE),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300))),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 20),
                      child: Icon(
                        Icons.info_outline,
                        color: Color(0XFFA8FFAE),
                        size: 70,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NovidadeCards extends StatelessWidget {
  @required
  final String rota;

  @required
  final String nomeCard;

  final String icone;

  const NovidadeCards({Key key, this.rota, this.nomeCard, this.icone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Color(0xFF5c5c5c),
        elevation: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 10,
                      ),
                      child: Text(nomeCard,
                          style: GoogleFonts.ropaSans(
                              textStyle: TextStyle(
                                  color: Color(0xFFe3e3e3),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300))),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 20),
                      child: Icon(
                        Icons.new_releases,
                        color: Color(0XFFe3e3e3),
                        size: 70,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
