import 'package:flutter/material.dart';

class PlusMinusEntry extends PopupMenuEntry<int> {
  late double cHeight;
  late double cWidth;
  late Color colorC;

  @override
  double height = 100;

  PlusMinusEntry(this.cHeight, this.cWidth,this.colorC);

  // height doesn't matter, as long as we are not giving
  // initialValue to showMenu().

  @override
  bool represents(int? n) => n == 1 || n == -1;

  @override
  PlusMinusEntryState createState() => PlusMinusEntryState();
}

class PlusMinusEntryState extends State<PlusMinusEntry> {
  void _plus1() {
    // This is how you close the popup menu and return user selection.
    Navigator.pop<int>(context, 1);
  }



  @override
  Widget build(BuildContext context) {
    double taskW = MediaQuery.of(context).size.width *1;
    double taskH = MediaQuery.of(context).size.height *0.08;

    Future  _minus1() async {

      setState(() {
        widget.cHeight = taskH;
        widget.cWidth=taskW;
        widget.colorC = Colors.red;

      });
      Navigator.pop<int>(context, -1);
    }
    return Column(
      children: [
        FlatButton(
          onPressed: _plus1,
          child: Text('Configurações'),
        ),

        FlatButton(
          onPressed: (){
           _minus1();
          },
          child: Text('Girar'),
        ),
      ],
    );
  }
}
