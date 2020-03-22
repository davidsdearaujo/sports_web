import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ).copyWith(left: 15),
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.search),
          SizedBox(width: 5),
          Text("Search"),
          // Expanded(
          //   child: TextField(
          //     decoration: InputDecoration(
          //       hintText: "Search",
          //       border: InputBorder.none,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
