import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoveProg extends StatefulWidget {

  const MoveProg({Key? key,}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MoveProgState();
  }
}

class _MoveProgState extends State<MoveProg> {

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
      top: yPosition+300,
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
            AlertDialog(
                backgroundColor: Color.fromRGBO(57, 57, 57, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                content: Builder(builder: (context) {
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;
                  return Stack(
                    children: [
                      Container(
                        height: height - 400,
                        width: width - 400,
                        ),
                    ],
                  );
                })),
          ],
        ),
      ),
    );
  }
}
