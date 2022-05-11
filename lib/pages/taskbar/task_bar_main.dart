// ignore: file_names
import 'package:aulas/pages/finder/finder.dart';
import 'package:aulas/pages/shortcuts/mov_items.dart';
import 'package:aulas/pages/taskbar/menu.dart';
import 'package:draggable_widget/draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../finder/mov.dart';

class TaskBar extends StatefulWidget {
  const TaskBar({Key? key}) : super(key: key);

  @override
  _TaskBarState createState() => _TaskBarState();
}

class _TaskBarState extends State<TaskBar> {
  Color colorC = Color.fromRGBO(37, 36, 87, 0.3);
  final dragController = DragController();

  double taskW(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.35;

  double taskW2(BuildContext context) => MediaQuery.of(context).size.width * 1;

  double taskH(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.08;

  double taskH2(BuildContext context) =>
      MediaQuery.of(context).devicePixelRatio * 20;

  var _tapPosition;

  void _showCustomMenu() {
    final dynamic overlay = Overlay.of(context)?.context.findRenderObject();
    showMenu(
        color: Color.fromRGBO(57, 57, 57, 0.8),
        context: context,
        items: <PopupMenuEntry<int>>[
          PlusMinusEntry(taskH(context), taskW(context), colorC)
        ],
        position: RelativeRect.fromRect(
            _tapPosition & Size(40, 40), // smaller rect, the touch area
            Offset.fromDirection(40, 70) &
                overlay?.size // Bigger rect, the entire screen
            ));
  }

  Future<T?> showMyDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    required Color barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    assert(builder != null);
    assert(barrierDismissible != null);
    assert(useSafeArea != null);
    assert(useRootNavigator != null);
    assert(debugCheckHasMaterialLocalizations(context));

    final CapturedThemes themes = InheritedTheme.capture(
      from: context,
      to: Navigator.of(
        context,
        rootNavigator: useRootNavigator,
      ).context,
    );

    return Navigator.of(context, rootNavigator: useRootNavigator)
        .push<T>(DialogRoute<T>(
      context: context,
      builder: builder,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      settings: routeSettings,
      themes: themes,
    ));
  }

  alertDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      barrierColor: null,
      context: context,
      builder: (_) => Container(
        height: 400,
        width: 800,
        child: Stack(
          children: [

                  MoveProg(),






            // AlertDialog(
            //     backgroundColor: Color.fromRGBO(57, 57, 57, 1),
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(10.0))),
            //     content: Builder(builder: (context) {
            //       var height = MediaQuery.of(context).size.height;
            //       var width = MediaQuery.of(context).size.width;
            //       return Container(
            //         height: height - 400,
            //         width: width - 400,
            //       );
            //     })),

            // DraggableWidget(
            //   initialPosition: AnchoringPosition.center,
            //   dragController: dragController,
            //   child: AlertDialog(
            //       backgroundColor: Color.fromRGBO(57, 57, 57, 1),
            //       shape: RoundedRectangleBorder(
            //           borderRadius:
            //           BorderRadius.all(
            //               Radius.circular(10.0))),
            //       content: Builder(
            //         builder: (context) {
            //           // Get available height and width of the build area of this widget. Make a choice depending on the size.
            //           var height = MediaQuery.of(context).size.height;
            //           var width = MediaQuery.of(context).size.width;
            //           return Container(
            //               height: height - 400,
            //               width: width - 400,
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 children: [
            //                   Container(
            //                     width: double.maxFinite,
            //                     height: 30,
            //                     color: Colors.black54,
            //                     child: Row(
            //                       children: [
            //                         Expanded(flex: 15,child: Container(width: 100,)),
            //                         Expanded(flex:1,child: Container(width: 30,color: Colors.green,)),
            //                         Expanded(flex:1,child: Container(width: 30,color: Colors.yellow,)),
            //                         Expanded(flex:1,child: Container(width: 30,color: Colors.red,)),
            //                       ],
            //                     ),
            //                   ),
            //                   Container(height: 100,),
            //                 ],
            //               ),
            //           );
            //         },
            //       ),
            //     ),
            // ),
          ],
        ),
      ),
    );
  }

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableWidget(
      intialVisibility: true,
      initialPosition: AnchoringPosition.bottomRight,
      verticalSpace: taskH2(context),
      horizontalSpace: 0,
      normalShadow: BoxShadow(
          blurRadius: 0.002,
          spreadRadius: 0,
          color: Color.fromRGBO(0, 9, 9, 0)),
      shadowBorderRadius: 0,
      draggingShadow: BoxShadow(
          blurRadius: 1,
          spreadRadius: 1000,
          color: Color.fromRGBO(0, 9, 9, 0.3)),
      child: Container(
        width: taskW2(context),
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
                  width: double.maxFinite,
                  height: taskH(context),
                  decoration: BoxDecoration(
                      color: colorC, //const Color.fromRGBO(37, 36, 87,0.7),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            alertDialog(context);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              "assets/1.png",
                              scale: 0.8,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/2.png",
                            scale: 0.8,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/3.png",
                            scale: 0.8,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/4.png",
                            scale: 0.8,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/5.png",
                            scale: 0.8,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/6.png",
                            scale: 0.8,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/7.png",
                            scale: 0.8,
                          ),
                        ),
                        VerticalDivider(
                          width: 0.2,
                          thickness: 1,
                          color: Colors.white38,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/8.png",
                            scale: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
