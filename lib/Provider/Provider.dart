import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class User {
  String _name = "";
  String _age = "";
  String get name => _name;
  set name(newName) => _name = newName;
  String get age => _age;
  set age(newAge) => _age = newAge;
}

class BasicProvider extends StatelessWidget {
  const BasicProvider({super.key});

  @override
  Widget build(BuildContext context) {
    var user = User();
    user.name = "ANHQUAN";
    user.age = "QUANANH";
    return Provider<User>.value(
      value: user,
      child: const BasicWidget(),
    );
  }
}

class BasicWidget extends StatelessWidget {
  const BasicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          DemoConsumerWidget(),
          DemoWithoutConsumerWidget(),
        ],
      ),
    );
  }
}

class DemoConsumerWidget extends StatelessWidget {
  const DemoConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) => Text(user.age),
    );
  }
}

class DemoWithoutConsumerWidget extends StatelessWidget {
  const DemoWithoutConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Container(
      child: Text(user.name),
    );
  }
}
