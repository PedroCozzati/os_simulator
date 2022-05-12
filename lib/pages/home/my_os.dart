import 'package:aulas/pages/shortcuts/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../background/background.dart';
import '../taskbar/task_bar_main.dart';
import 'package:draggable_widget/draggable_widget.dart';

class MyOs extends StatefulWidget {
  const MyOs({Key? key}) : super(key: key);

  @override
  _MyOsState createState() => _MyOsState();
}

class _MyOsState extends State<MyOs> {
  bool _isVisible = true;
  void teste() {
    setState(() {

      _isVisible = !_isVisible;
    });
  }
  late Offset position;

  @override
  Widget build(BuildContext context) {
    final dragController = DragController();


    double taskW = MediaQuery.of(context).size.width * 1;
    double taskH2 = MediaQuery.of(context).devicePixelRatio * 30;
    double taskH = MediaQuery.of(context).size.height * 1;
    return Container(
      width: taskW,
      height: taskH,
      child: Stack(
        children: [
          BackGround(),
          ShortCuts(),
          Visibility(
              visible: _isVisible,
              child:TaskBar()

          ),




        ],
      ),
    );
  }
}
