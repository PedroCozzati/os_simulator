import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoveProg extends StatefulWidget {
  const MoveProg({
    Key? key,
  }) : super(key: key);

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
    double taskH2 = MediaQuery.of(context).devicePixelRatio * 3;
    double taskH = MediaQuery.of(context).size.width * 0.0004;
    return Positioned(
      top: yPosition + 300,
      left: xPosition + 30,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AlertDialog(
                  backgroundColor: Color.fromRGBO(57, 57, 57, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  content: Builder(builder: (context) {
                    var height = MediaQuery.of(context).size.height;
                    var width = MediaQuery.of(context).size.width;
                    return Container(
                      child: Stack(
                        children: [

                              Container(
                                height: height-400,
                                width: width-400,
                                // child: Scrollbar(
                                //   child: ListView(
                                //     padding: EdgeInsets.all(0),
                                //     scrollDirection: Axis.vertical,
                                //     children: [
                                //
                                //     ],
                                //   ),
                                // ),
                              ),
                            ],

                      ),
                    );
                  })),
            ],
          ),
          GestureDetector(
            onPanUpdate: (tapInfo) {
              setState(() {
                xPosition += tapInfo.delta.dx;
                yPosition += tapInfo.delta.dy;
              });
            },
            child: Container(
              height: 30,
              width: taskW - 355,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0,bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary:Colors.red,
                          onPrimary: Colors.red,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(0),
                        ),
                        child: Icon(
                          Icons.close,size: 0,
                        )),ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary:Colors.yellow,
                          onPrimary: Colors.yellow,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(0),
                        ),
                        child: Icon(
                          Icons.close,size: 0,
                        )),ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary:Colors.green,
                          onPrimary: Colors.green,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(0),
                        ),
                        child: Icon(
                          Icons.close,size: 0,
                        )),
                    Container(
                      width:taskW-550,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
