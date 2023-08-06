import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/brew.dart';
import 'brew_tile.dart';

class BrewList extends StatelessWidget {
  const BrewList({super.key});

  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context);
    brews?.forEach((brew) {
      print(brew.expense);
      print(brew.value);
    });
    //return BrewTile(brew: brews?[0]);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: brews?.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews?[index]);
      },
    );
  }
}
