import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:requests/requests.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yara Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String yarafilename = 'No YARA file was chosen';
  String apkfilename = 'No APK file was chosen';
  // late FilePickerResult apkFile;
  var apkFilePath;
  final url = 'https://www.virustotal.com/api/v3/files';

  var _postJson = [];

  void fetchData() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postJson = jsonData;
      });
    } catch (err) {
      print('connection error');
    }
  }

  // void postData() async {
  //   try {
  //     final response = await post(Uri.parse(url), body: {
  //       "x-apikey":
  //           "56a524fdd1fcfde4168d1621c5861595e3e7c6806749c44f7d73d65ca69b6f11",
  //       "Content-Type":
  //           "multipart/form-data; boundary=---011000010111000001101001",
  //     });
  //   } catch (err) {
  //     print('connection error');
  //   }
  // }

  void uploadFile() async {
    try {
      var request = MultipartRequest("POST", Uri.parse(url));
      request.fields["x-apikey"] =
          "56a524fdd1fcfde4168d1621c5861595e3e7c6806749c44f7d73d65ca69b6f11";

      // var upload = MultipartFile.fromBytes('file', stream, length)
    } catch (err) {
      print('connection error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 45,
              child: ElevatedButton(
                onPressed: () async {
                  // final file = apkFile.files.first;
                  // postData();
                },
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              height: 45,
              child: ElevatedButton(
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles();
                  if (result == null) return;

                  setState(() {
                    apkfilename = result.files.first.name;
                    apkFilePath = result.files.first.path!;
                  });
                },
                child: const Text('Upload APK file'),
              ),
            ),
            Text(apkfilename),
          ],
        ),
      ),
    );
  }
}
