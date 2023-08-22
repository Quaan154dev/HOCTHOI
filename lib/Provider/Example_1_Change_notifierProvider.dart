import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Di chuyển dử liệu giữa các màn hình khác nhau
main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Counter(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterHome(),
      ),
    ),
  );
}

class Counter with ChangeNotifier {
  int _count = 0; // private variable
  int get getcount => _count; // get lấy ra
  increment() {
    _count++;
    notifyListeners(); // cho biết sự thay đổi và nó sẻ rebuild (thông báo)
  }
}

class CounterHome extends StatelessWidget {
  const CounterHome({super.key});

  @override
  Widget build(BuildContext context) {
    final counterrrr = Provider.of<Counter>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<Counter>().getcount.toString(),
              style: const TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  // push đẩy cái mh mới lên đầu
                  context,
                  MaterialPageRoute(builder: (_) => const SecondScream()),
                );
              },
              child: const Text("GO TO FIRST SCREEN"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterrrr.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondScream extends StatelessWidget {
  const SecondScream({super.key});

  @override
  Widget build(BuildContext context) {
    final counterrrr = Provider.of<Counter>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Scream"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<Counter>().getcount.toString(),
              style: const TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  //lấy ra , lấy cái mh thứ nhất
                  context,
                );
              },
              child: const Text("GO TO HOME SCREEN"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterrrr.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
