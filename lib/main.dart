import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:requests/requests.dart';
import 'package:http/http.dart' as http;

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
  late FilePickerResult apkFile;

  // void Testrequest() async {
  //   var r = await Requests.get('https://google.com');
  //   r.raiseForStatus();
  //   String body = r.content();

  // var r = await Requests.post('https://reqres.in/api/users',
  //     body: {
  //       'userId': 10,
  //       'id': 91,
  //       'title': 'aut amet sed',
  //     },
  //     bodyEncoding: RequestBodyEncoding.FormURLEncoded);
  // }

  Future<http.Response> fetchGoogle() async {
    final response = await http.get(Uri.parse('https://google.com'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Fail');
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
                  Future<http.Response> testgoogle = fetchGoogle();
                  // print(testgoogle);
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
                  apkFile = result;

                  setState(() {
                    apkfilename = result.files.first.name;
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
