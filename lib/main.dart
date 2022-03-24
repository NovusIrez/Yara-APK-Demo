import 'package:flutter/material.dart';

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
  String yarafilename = 'No YARA file has been uploaded';
  String apkfilename = 'No APK file has been uploaded';

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
              width: 200,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text('Start'),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              width: 200,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text('Upload YARA file'),
              ),
            ),
            Text(yarafilename),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 200,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
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
