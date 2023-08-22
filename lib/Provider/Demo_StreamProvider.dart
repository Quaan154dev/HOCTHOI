import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class DemoStreamProvider extends StatelessWidget {
  const DemoStreamProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<int>.value(
      value: getAge(),
      initialData: 0,
      child: const DemoFutureWidget(),
    );
  }

  Stream<int> getAge() {
    return Stream.fromFuture(
      Future.delayed(const Duration(seconds: 1), () {
        return 250;
      }),
    );
  }
}

class DemoFutureWidget extends StatelessWidget {
  const DemoFutureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<int>(builder: (context, value, child) {
      return Center(
        child: Text(
          value.toString(),
          style: const TextStyle(fontSize: 28),
        ),
      );
    });
  }
}
