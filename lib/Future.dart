import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ffi';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FutureAndBuilder extends StatefulWidget {
  const FutureAndBuilder({super.key});

  @override
  State<FutureAndBuilder> createState() => _FutureAndBuilderState();
}

class _FutureAndBuilderState extends State<FutureAndBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          // render ui
          child: FutureBuilder<String>(
            //FutureBuilder: dựa vào Future faction đưa vào rồi dựa vào đó reder width tg ứng
            future: delayString(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text(
                  snapshot.error.toString(),
                  style: const TextStyle(fontSize: 40),
                );
              }
              // if(snapshot.data)
              if (snapshot.hasData) {
                return Text(
                  snapshot.data.toString(),
                  style: const TextStyle(fontSize: 40),
                );
              }
              // return const Text(
              //   "waiting for result",
              //   style: TextStyle(fontSize: 40),
              // );
              return const CircularProgressIndicator();
            },
          ),
        ),
        Container(
          child: TextButton.icon(
            style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(10)),
            onPressed: () async {
              asyncMethod();
              try {
                var number = await delayError();
                print(number);
              } catch (e) {
                print(e.toString());
              }
              print("chay binh thương");
              getAge().then((e) => {print(e)});
            },
            label: const Text("check"),
            icon: const Icon(Icons.abc),
          ),
        )
      ],
    );
  }
}

//cách 1:
Future<void> asyncMethod() {
  return Future.delayed(Duration(seconds: 5), () => print("async"));
}

// khi có kết quả trã về thì mình sử dụng đến  "async" ở onPressed và  "await" ở biến
Future<int> delayNumber() {
  return Future.delayed(const Duration(seconds: 6), () => 154);
}

Future<String> delayString() {
  return Future.delayed(Duration(seconds: 3), () => "anh quan");
}

Future<int> delayError() {
  return Future.delayed(
      Duration(seconds: 3), () => throw Exception("co loi xay ra !"));
}
//cách 2: callback

Future<int> getAge() {
  final c = Completer<int>();
  Future.delayed(const Duration(seconds: 3), () {
    c.complete(1200);
  });
  return c.future;
}
