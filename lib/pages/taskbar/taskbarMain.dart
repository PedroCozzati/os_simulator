import 'package:aulas/pages/taskbar/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskBar extends StatefulWidget {
  const TaskBar({Key? key}) : super(key: key);

  @override
  _TaskBarState createState() => _TaskBarState();
}

class _TaskBarState extends State<TaskBar> {
  @override
  Widget build(BuildContext context) {
    double taskW = MediaQuery.of(context).size.width * 1;
    double taskH = MediaQuery.of(context).size.height * 0.05;
    Color colorC = Color.fromRGBO(37, 36, 87, 0.7);

    var _tapPosition;

    void _showCustomMenu() {
      final dynamic overlay = Overlay.of(context)?.context.findRenderObject();
      showMenu(
          context: context,
          items: <PopupMenuEntry<int>>[PlusMinusEntry(taskH, taskW, colorC)],
          position: RelativeRect.fromRect(
              _tapPosition & Size(40, 40), // smaller rect, the touch area
              Offset.fromDirection(40, 70) &
                  overlay?.size // Bigger rect, the entire screen
              ));
    }

    void _storePosition(TapDownDetails details) {
      _tapPosition = details.globalPosition;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: GestureDetector(
              onTap: () {},
              onLongPress: () {},
              onSecondaryTapDown: _storePosition,
              onSecondaryTap: () {
                _showCustomMenu();
              },
              child: Container(
                width: taskW,
                height: taskH,
                decoration: BoxDecoration(
                    color: colorC, //const Color.fromRGBO(37, 36, 87,0.7),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeOKZ5IicUoWdubZRSIQQlmLP3l574XJiW22ImFZQJSjizDxPFy7AtE7FrzUKX-N1Wn0U&usqp=CAU",
                      ),
                    ),
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
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
