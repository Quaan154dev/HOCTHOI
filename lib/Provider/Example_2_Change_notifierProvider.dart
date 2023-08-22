import 'package:async_demo/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MySetting(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp1(),
      ),
    ),
  );
}

class MySetting with ChangeNotifier {
  String text = "Done";
  Color color = Colors.red;
  void ChangeText() {
    if (text == 'helloo') {
      text = "world";
    } else {
      text = "helloo";
    }
    notifyListeners();
  }

  void ChangeColor() {
    if (color == Colors.green) {
      color = Colors.red;
    } else {
      color = Colors.green;
    }
    notifyListeners();
  }
}

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    // Mseting : dùng để lưu trử dử liệu của class MySetting
    return Consumer<MySetting>(builder: (context, Mseting, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Provider Demo"),
          backgroundColor: Mseting.color,
        ),
        drawer: Drawer(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Mseting.ChangeColor();
                      Navigator.pop(context);
                    },
                    child: const Text("Change Color")),
                ElevatedButton(
                    onPressed: () {
                      Mseting.ChangeText();
                      Navigator.pop(context);
                    },
                    child: const Text("Change Text")),
              ],
            ),
          ),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Mseting.ChangeText();
                  },
                  child: const Text("Change Text")),
              Text("${Mseting.text}"),
            ],
          ),
        ),
      );
    });
  }
}
