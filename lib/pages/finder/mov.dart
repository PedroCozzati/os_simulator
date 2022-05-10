import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovItem extends StatefulWidget {

final Widget widget;

  const MovItem({Key? key, required this.widget, }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MovItemState();
  }
}

class _MovItemState extends State<MovItem> {

  double xPosition = 0;
  double yPosition = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double taskW = MediaQuery.of(context).size.width * 1;
    double taskH2 = MediaQuery.of(context).devicePixelRatio *3;
    double taskH = MediaQuery.of(context).size.width *0.0004;
    return Positioned(
      top: yPosition,
      left: xPosition,
      child: GestureDetector(
        onPanUpdate: (tapInfo) {
          setState(() {
            xPosition += tapInfo.delta.dx;
            yPosition += tapInfo.delta.dy;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 widget,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
