import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class Counter {
  final ValueNotifier<int> valueNotifier = ValueNotifier(0);
}

class DemoValueListenableProvider extends StatelessWidget {
  const DemoValueListenableProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<Counter>(
      create: (context) => Counter(),
      child: Consumer<Counter>(
        builder: (context, counter, child) {
          return ValueListenableProvider<int>.value(
            value: counter.valueNotifier,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  DemoConsumerWidget(),
                  OtherWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DemoConsumerWidget extends StatelessWidget {
  const DemoConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<int>(
      builder: (context, value, child) {
        return Text(
          value.toString(),
          style: const TextStyle(fontSize: 28),
        );
      },
    );
  }
}

class OtherWidget extends StatelessWidget {
  const OtherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Text("Incrementt"),
      onPressed: () {
        final counter = Provider.of<Counter>(context, listen: true);
        counter.valueNotifier.value++;
      },
    );
  }
}
