import 'package:flutter/widgets.dart';

class BackGround extends StatelessWidget {
  const BackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double taskW = MediaQuery.of(context).size.width * 1;
    double taskH = MediaQuery.of(context).size.height * 1;
    return Container(
      width: taskW,
      height: taskH,
      child: Image(
        image: AssetImage("assets/bg.jpeg"),
        fit: BoxFit.fill,
      ),
    );
  }
}
