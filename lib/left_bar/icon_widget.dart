import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final bool selected;

  const IconWidget(
    this.icon, {
    Key key,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Icon(
        icon,
        size: 30,
        color: selected ? Colors.white : Colors.white24,
      ),
    );
  }
}
