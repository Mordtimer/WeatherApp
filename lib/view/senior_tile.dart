import 'package:flutter/material.dart';

class SeniorTile extends StatefulWidget {
  SeniorTile(this.icon, this.text);

  final String text;
  final Icon icon;

  @override
  _SeniorTileState createState() => _SeniorTileState();
}

class _SeniorTileState extends State<SeniorTile> {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    this.widget.icon,
                    Text(
                      this.widget.text,
                      style: Theme.of(context).primaryTextTheme.headline4.copyWith(color: Colors.white),
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