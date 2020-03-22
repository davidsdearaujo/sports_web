import 'package:flutter/material.dart';

import 'icon_widget.dart';

class LeftBarWidget extends StatelessWidget {
  final Animation<Color> animation;

  LeftBarWidget(this.animation, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 50),
            child: FlutterLogo(
              style: FlutterLogoStyle.markOnly,
              size: 50,
              colors: white,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconWidget(Icons.home, selected: true),
                IconWidget(Icons.location_on),
                IconWidget(Icons.add_circle),
                IconWidget(Icons.star),
                IconWidget(Icons.info),
              ],
            ),
          )
        ],
      ),
      builder: (context, child) {
        return Container(
          child: child,
          padding: EdgeInsets.all(25),
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color.lerp(animation.value, Colors.black, 0.1),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        );
      },
    );
  }

  final MaterialColor white = MaterialColor(0xFFFFFFFF, {
    50: Color.fromRGBO(255, 255, 255, 1),
    100: Color.fromRGBO(255, 255, 255, 1),
    200: Color.fromRGBO(255, 255, 255, 1),
    300: Color.fromRGBO(255, 255, 255, 1),
    400: Color.fromRGBO(255, 255, 255, 1),
    500: Color.fromRGBO(255, 255, 255, 1),
    600: Color.fromRGBO(255, 255, 255, 1),
    700: Color.fromRGBO(255, 255, 255, 1),
    800: Color.fromRGBO(255, 255, 255, 1),
    900: Color.fromRGBO(255, 255, 255, 1),
  });
}
