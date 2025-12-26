import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_stream_project/pages/onbording_page.dart';

void main() {
  runApp(LiveStreamApp());
}

class LiveStreamApp extends StatelessWidget {
  const LiveStreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Live Stream App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.red),
      home: OnbordingPage(),
    );
  }
}
