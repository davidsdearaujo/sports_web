import 'package:first_web/models/sport_model.dart';
import 'package:flutter/material.dart';

class SelectedSportWidget extends StatelessWidget {
  final Animation<double> animation;
  final SportModel selectedSport;

  const SelectedSportWidget({
    Key key,
    @required this.animation,
    @required this.selectedSport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: AspectRatio(
        aspectRatio: 1.3,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 100, left: 150),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: selectedSport.colors,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  selectedSport.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  selectedSport.value,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white),
                ),
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.network(
                    selectedSport.imageUrl,
                    width: MediaQuery.of(context).size.height * 0.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(animation.value, 0),
          child: child,
        );
      },
    );
  }
}
