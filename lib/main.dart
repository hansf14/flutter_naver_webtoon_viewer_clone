import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_naver_webtoon_viewer_clone/screens/home_screen.dart';
import 'package:flutter_naver_webtoon_viewer_clone/services/api_service.dart';

void main() {
  MyHttpOverrides.init();

  // ApiService().getTodaysToons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
    );
  }
}
