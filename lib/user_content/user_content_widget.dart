import 'package:first_web/models/sport_model.dart';
import 'package:first_web/user_content/card_widget.dart';
import 'package:first_web/user_content/header_widget.dart';
import 'package:flutter/material.dart';

import 'search_widget.dart';

class UserContentWidget extends StatelessWidget {
  final List<SportModel> sportsList;
  final void Function(SportModel model) onSelect;

  const UserContentWidget(
    this.sportsList, {
    Key key,
    this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeaderWidget(),
            SizedBox(height: 40),
            Text(
              "Let's Go",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            SearchWidget(),
            SizedBox(height: 30),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: sportsList.map((e) => CardWidget(e, onSelect)).toList(),
            )
          ],
        ),
      ),
    );
  }
}
