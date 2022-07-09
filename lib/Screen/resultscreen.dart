import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

import 'package:yara_apk/VirusTotalReport.dart';

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
              onPressed: () async {
                var report = VTReport.fromJson(responseback);
                print('Sha256 = ${report.data?.attributes?.sha256}');
              },
              child: const Text('Download APK details'),
            ),
          ),
        ],
      ),
    );
  }
}
