import 'package:first_web/models/sport_model.dart';
import 'package:first_web/user_content/user_content_widget.dart';
import 'package:flutter/material.dart';

import 'home_repository.dart';
import 'left_bar/left_bar_widget.dart';
import 'selected_sport/selected_sport_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController colorController;
  Animation<double> animation;
  Animation<Color> menuAnimation;

  final _repository = HomeRepository();
  final sportsList = <SportModel>[];
  SportModel selectedSport;

  void configAnimation() {
    animation = Tween<double>(
      begin: 0,
      end: 50 - 1.3 * MediaQuery.of(context).size.height,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ));
  }

  void configColor(Color begin, Color end) {
    menuAnimation = ColorTween(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(
      parent: colorController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ));
  }

  @override
  void initState() {
    super.initState();
    sportsList.addAll(_repository.getSports());
    selectedSport = sportsList[1];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    colorController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    configColor(sportsList[1].colors[1], sportsList[1].colors[1]);
    configAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    colorController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      configAnimation();
      return Material(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Row(
                children: <Widget>[
                  SelectedSportWidget(
                    animation: animation,
                    selectedSport: selectedSport,
                  ),
                  Expanded(
                    child: UserContentWidget(
                      sportsList,
                      onSelect: (model) async {
                        if (selectedSport != model) {
                          setState(() {
                            configColor(
                              selectedSport.colors[1],
                              model.colors[1],
                            );
                          });
                          colorController.reset();
                          colorController.forward();
                          await controller.forward();
                          setState(() => selectedSport = model);
                          await controller.reverse();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: LeftBarWidget(menuAnimation),
            ),
          ],
        ),
      );
    });
  }
}
