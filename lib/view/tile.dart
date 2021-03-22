import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  Tile(this.icon, this.text);

  final String text;
  final Icon icon;

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 150,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    this.widget.icon,
                    Text(
                      this.widget.text,
                      style: Theme.of(context).primaryTextTheme.headline5,
                    ),
                  ],
                ),
              ),
            ),
            flex: 10,
          ),
        ],
      ),
    );
  }
}