import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoveableStackItem extends StatefulWidget {
  final String img;
  final String text;
  final double pos;

  const MoveableStackItem({Key? key, required this.img,required this.pos, required this.text}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MoveableStackItemState();
  }
}

class _MoveableStackItemState extends State<MoveableStackItem> {
  double xPosition = 0;
  double yPosition = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: yPosition+widget.pos,
      left: xPosition+30,
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
                  Image.asset(
                    widget.img,
                    scale: 2,
                  ),
                  SizedBox(height: 10,),
                  DefaultTextStyle(
                    style: TextStyle(fontSize: 10,color: Colors.white),
                    child: Text(widget.text),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
