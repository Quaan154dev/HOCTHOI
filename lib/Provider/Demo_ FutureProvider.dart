import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class DemoFutureProvider extends StatelessWidget {
  const DemoFutureProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureProvider<int>.value(
      initialData: 0,
      value: getAge(),
      child: const DemoFutureWidget(),
    );
  }

  Future<int> getAge() {
    return Future.delayed(const Duration(seconds: 5), () {
      return 500;
    });
  }
}

class DemoFutureWidget extends StatelessWidget {
  const DemoFutureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<int>(
      builder: (context, value, child) {
        return Center(
          child: Text(
            value.toString(),
            style: const TextStyle(fontSize: 20),
          ),
        );
      },
    );
  }
}
