import 'package:async_demo/Provider/Demo_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import 'Demo_ProxyProvider.dart';
import 'Demo_ProxyProvider.dart';

class CounterApi {
  int _count = 0;
  int get count => _count;
}

class CounterService {
  CounterApi _api;
  CounterService({required CounterApi api}) : _api = api;
  CounterApi get api => _api;
}

class CounterModel with ChangeNotifier {
  CounterService _counterService;
  CounterModel({required CounterService counterService})
      : _counterService = counterService;
  CounterService get counterService => _counterService;
}

class Demo_ProxyProvider extends StatelessWidget {
  const Demo_ProxyProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(
          value: CounterApi(),
        ),
        ProxyProvider<CounterApi, CounterService>(
          update: (context, counterApi, previous) =>
              CounterService(api: counterApi),
        ),
      ],
      child: const TestWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: CounterModel(counterService: Provider.of(context)),
      child: Consumer<CounterModel>(
        builder: (context, model, child) => Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  model.counterService.api.count.toString(),
                  style: const TextStyle(fontSize: 40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
