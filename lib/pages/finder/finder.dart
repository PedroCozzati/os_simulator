import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Finder extends StatefulWidget {
  const Finder(BuildContext context, {Key? key}) : super(key: key);

  @override
  _FinderState createState() => _FinderState();
}

alertDialog(context) {
  // This is the ok button
  Widget ok = FlatButton(
    child: Text("Okay"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // show the alert dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: 700,
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(57, 57, 57, 0.8),
        ),
      );
    },
  );
}

class _FinderState extends State<Finder> {
  @override
  Widget build(BuildContext context) {
    return alertDialog(context);
  }
}
