

import 'package:flutter/material.dart';

class PopupMenuButtonWidget extends StatelessWidget {
  const PopupMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PopupMenuButton Example'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              print(result);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Value1',
                child: Text('Value1'),
              ),
              const PopupMenuItem<String>(
                value: 'Value2',
                child: Text('Value2'),
              ),
              const PopupMenuItem<String>(
                value: 'Value3',
                child: Text('Value3'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
