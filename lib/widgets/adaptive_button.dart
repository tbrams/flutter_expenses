import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveButton extends StatelessWidget {
  final String text;
  final Function handler;

  AdaptiveButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Colors.purple,
            child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: handler,
          )
        : RaisedButton(
            child: Text(text),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button.color,
            onPressed: handler,
          );
  }
}
