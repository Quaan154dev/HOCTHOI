import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 1.NHÀ CUNG CẤP
class Counter with ChangeNotifier {
  int _count = 0; // private variable
  int get getcount => _count; // get lấy ra
  increment() {
    _count++;
    notifyListeners(); // cho biết sự thay đổi và nó sẻ rebuild (thông báo)
  }
}

// 2.NHÀ PHÂN PHỐI : kết nối nhà cung cấp với người tiêu dung
class DemoChangeNotifierProvider extends StatelessWidget {
  const DemoChangeNotifierProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (context) => Counter(), // nếu create có có j thì (_) cx dc
      child: const TestWidget(),
    );
  }
}

// 3. NGƯỜI SỬ DỤNG (Consumer)
class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context, listen: true);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Counter>(
            builder: (context, myModel, child) {
              return Text(myModel.getcount.toString());
            },
          ),
          Text(
            // counter.getcount.toString(),
            context.watch<Counter>().getcount.toString(),
            style: const TextStyle(fontSize: 48),
          ),
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              counter.increment();
              // context.read<Counter>().getcount.;
            },
            // child: const Text(
            //   "Increment",
            //   style: TextStyle(fontSize: 8),
            // ),
          ),
        ],
      ),
    );
  }
}
