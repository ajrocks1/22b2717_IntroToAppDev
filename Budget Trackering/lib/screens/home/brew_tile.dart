import 'package:flutter/material.dart';
import 'package:brew_crew/models/brew.dart';
import 'package:swipe_widget/swipe_widget.dart';

class BrewTile extends StatelessWidget {
  final Brew? brew;
  int? index;
  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text("${brew?.expense}"),
          subtitle: Text('Money ${brew?.value}'),
        ),
      ),
    );
  }
}
