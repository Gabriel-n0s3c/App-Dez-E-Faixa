import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cards extends StatelessWidget {
  @required
  final String rota;

  @required
  final String nomeCard;

  final String icone;

  final bool enabled;

  const Cards({Key key, this.rota, this.nomeCard, this.icone, this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {},
      onTap: () {
        enabled ? Navigator.of(context).pushNamed(rota) : print("destivado");
      },
      child: Card(
        color: enabled ? Color(0xFF05500A) : Colors.grey,
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
                                  color: enabled
                                      ? Color(0xFFA8FFAE)
                                      : Colors.black54,
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
                            color: enabled ? Color(0xFFA8FFAE) : Colors.black54,
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
