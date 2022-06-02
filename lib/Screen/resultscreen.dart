import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key, required this.responseback}) : super(key: key);
  String responseback;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/result.txt');
  }

  Future<File> writeData(String data) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(data);
  }

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
                writeData(responseback);
                // const filename = 'apkdetail.txt';
                // var file =
                //     await File(filename).writeAsString(jsonData.toString());
              },
              child: const Text('Download APK details'),
            ),
          ),
          // Text(
          //     'File extension: $jsonData["data"]["attributes"]["meaningful_name"]'),
          // Text('File extension: $jsonData["data"]["attributes"]["sha256"]'),
          // Text(
          //     'Yara Rule name: $jsonData["data"]["attributes"]["crowdsourced_yara_results"][0]["ruleset_name"]'),
          // Text(
          //     'Rule ID: $jsonData["data"]["attributes"]["crowdsourced_yara_results"][0]["ruleset_id"]'),
          // Text(
          //     'Rule Source: $jsonData["data"]["attributes"]["crowdsourced_yara_results"][0]["source"]'),
        ],
      ),
    );
  }
}

class Storage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/result.txt');
  }

  Future<File> writeData(String data) async {
    final file = await _localFile;
    print(data);
    // Write the file
    return file.writeAsString("test");
  }
}
