import 'dart:async';
import 'dart:ffi';
// import 'package:async_demo/Future.dart';
import 'package:flutter/material.dart';
import 'Provider/Demo_ FutureProvider.dart';
import 'Provider/Demo_MultiProvider.dart';
import 'Provider/Demo_ProxyProvider.dart';
import 'Provider/Demo_StreamProvider.dart';
import 'Provider/Demo_ValueListenableProvider.dart';
import 'Provider/Demo_change_notifier.dart';
import 'Provider/Provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: DemoValueListenableProvider(),
      ),
    );
  }
}

/*
1. những cách tạo ra stream
2.listenr 1 stream
3.có 2 loại stream single subscription và broadcast
3.stream transformed
 */

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: DemoValueListenableProvider(),
    );
  }
}
