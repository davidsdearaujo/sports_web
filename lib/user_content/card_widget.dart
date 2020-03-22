import 'package:first_web/models/sport_model.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final SportModel model;
  final void Function(SportModel model) onSelect;

  const CardWidget(this.model, this.onSelect, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: GestureDetector(
        onTap: () => onSelect(model),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 25),
              child: AspectRatio(aspectRatio: 2.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.3, 0.5, 0.7],
                  colors: model.colors,
                ),
              ),
            ),
            Positioned.fill(
              bottom: 20,
              child: Image.network(
                model.imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              child: Text(
                model.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
