import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.blue,
          backgroundImage: NetworkImage("https://i.imgur.com/qUtldsD.png"),
        ),
        Expanded(child: Center(child: Text("Seja bem vindo Wallace!")))
      ],
    );
  }
}
