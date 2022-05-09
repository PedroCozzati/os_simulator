import 'package:flutter/widgets.dart';

import '../background/background.dart';
import '../taskbar/taskbarMain.dart';
import 'package:draggable_widget/draggable_widget.dart';

class MyOs extends StatefulWidget {
  const MyOs({Key? key}) : super(key: key);

  @override
  _MyOsState createState() => _MyOsState();
}

class _MyOsState extends State<MyOs> {
  final dragController = DragController();
  @override
  Widget build(BuildContext context) {
    double taskW = MediaQuery.of(context).size.width *1;
    double taskH = MediaQuery.of(context).size.height *1;
    return Container(
      width: taskW,
      height: taskH,
      child: Stack(
        children:  [
          BackGround(),
          //ShortCuts();

          DraggableWidget(
            intialVisibility: true,
            initialPosition: AnchoringPosition.center,
            verticalSpace: 40,
            horizontalSpace: 1,
            normalShadow: BoxShadow(blurRadius: 0.002,spreadRadius: 0,color: Color.fromRGBO(0, 9, 9, 0)),
            shadowBorderRadius: 0,
            draggingShadow: BoxShadow(blurRadius: 1,spreadRadius: 1000,color: Color.fromRGBO(0, 9, 9, 0.2)),
            child: TaskBar(),
            dragController: dragController,
            ),
        ],
      ),
    );
  }
}
