import 'package:async_demo/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter1 with ChangeNotifier {
  int _count = 0;
  int get getcount => _count;
  increment() {
    _count++;
    notifyListeners(); // cho biết sự thay đổi và nó sẻ rebuild
  }
}

class Counter2 with ChangeNotifier {
  int _count = 10;
  int get count => _count;
  increment() {
    _count++;
    notifyListeners(); // cho biết sự thay đổi và nó sẻ rebuild
  }
}

class MySettings with ChangeNotifier {
  bool _isDark = false;
  get getIsDark => _isDark;
  void setBrightness(bool value) {
    _isDark = value;
    notifyListeners();
  }
}

class DemoMultiProvider extends StatelessWidget {
  const DemoMultiProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter1()),
        ChangeNotifierProvider(create: (context) => MySettings()),
      ],
      child: const TestWidget1(),
    );
  }
}

class TestWidget1 extends StatelessWidget {
  const TestWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    final counter1 = Provider.of<Counter1>(context, listen: true);
    final counter2 = Provider.of<MySettings>(context, listen: true);
    return MaterialApp(
      title: "Flutter Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: context.watch<MySettings>().getIsDark
            ? Brightness.dark
            : Brightness.light,
        primaryColor: Colors.blue,
      ),
      home: const MyHomePage1(),
    );
  }
}

class MyHomePage1 extends StatelessWidget {
  const MyHomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    final counterrr = Provider.of<Counter1>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Provider"),
        actions: [
          Switch(
              value: context.watch<MySettings>().getIsDark,
              onChanged: (newValue) {
                Provider.of<MySettings>(context, listen: false)
                    .setBrightness(newValue);
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You have pushed the button this many times"),
            Text(context.watch<Counter1>().getcount.toString(),
                style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterrr.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


//  children: [
//         Text(
//           'count1 = ${counter1.count.toString()} count2 = ${counter2.count.toString()}',
//           style: const TextStyle(fontSize: 48),
//         ),
//         FloatingActionButton(
//           onPressed: () {
//             counter1.increment();
//             counter2.increment();
//           },
//           child: const Text(
//             "Increment",
//             style: TextStyle(fontSize: 8),
//           ),
//         ),
//       ],