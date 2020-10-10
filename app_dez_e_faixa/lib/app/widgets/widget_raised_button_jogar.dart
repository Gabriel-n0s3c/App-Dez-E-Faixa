import 'package:flutter/material.dart';

class WidgetRaisedButtonJogar extends StatelessWidget {
  const WidgetRaisedButtonJogar({
    Key key,
    this.appRoute,
  }) : super(key: key);
  final String appRoute;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(appRoute);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0a571f), Color(0xff6bd688)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          constraints: BoxConstraints(maxWidth: 300.0, maxHeight: 50.0),
          alignment: Alignment.center,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Iniciar partida!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
