import 'package:draggable_widget/draggable_widget.dart';
import 'package:flutter/widgets.dart';

import 'mov_items.dart';

class ShortCuts extends StatefulWidget {
  const ShortCuts({Key? key}) : super(key: key);

  @override
  _ShortCutsState createState() => _ShortCutsState();
}

class _ShortCutsState extends State<ShortCuts> {
  final dragController = DragController();

  @override
  Widget build(BuildContext context) {
    double taskW = MediaQuery.of(context).size.width * 1;
    double taskH2 = MediaQuery.of(context).devicePixelRatio * 30;
    double taskH = MediaQuery.of(context).size.height * 1;
    return Stack(children: const [
      MoveableStackItem(img: "assets/i.png",pos: 30,text: "pasta 1",),
      MoveableStackItem(img: "assets/i.png",pos:130,text: "pasta 2",),
      MoveableStackItem(img: "assets/i.png",pos:230,text: "pasta 3"),
      MoveableStackItem(img: "assets/i.png",pos:330,text: "pasta 4"),
      MoveableStackItem(img: "assets/i.png",pos:430,text: "pasta 5"),
    ]);
  }
}
