import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key, required this.responseback}) : super(key: key);
  Map<String, dynamic> responseback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis Result'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 300,
            height: 45,
            child: ElevatedButton(
              onPressed: () async {},
              child: const Text('Download APK details'),
            ),
          ),
        ],
      ),
    );
  }
}
