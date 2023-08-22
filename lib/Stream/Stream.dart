import 'dart:async';

Stream<int> counteStream(int value) async* {
  // async : dùng cho future còn async* dùng cho stream
  for (var i = 0; i <= value; i++) {
    yield i; // yield:trã về nhiều kết quả được
  }
}

Future<int> sumStream(Stream<int> stream) async {
  int sum = 0;
  await for (int value in stream) {
    sum += value;
  }
  return sum;
}
/* Strem có 2 loại : Single Subcription và  broadcast
+ Single Subcription :hứng dử liệu dc 1 lần còn broadcast thì nhiều lần
*/
// để lấy ra gtri steam :listen or await for
//- Sự khác nhau : listen và await for
/*
listen thì chạy từ đầu cuối không biết đồng bộ
await for thì phải chờ chạy hết theo thứ tự  phải bất đồng bộ
*/

var dataFuture = Future.delayed(Duration(seconds: 2), () {
  return 10;
});

var dataIterble = Iterable.generate(10, (value) {
  return value;
});

main() async {
  StreamController<String> timerStream = new StreamController<String>();

  print(await sumStream(counteStream(10)));
  print("begin");

  print(counteStream(10).listen((event) {
    print(event.toString());
  }));

  await for (int value in counteStream(10)) {
    print(value.toString());
  }

  print("end");

  print("------------------Lấy dử liệu :---------------");
  Stream<int> stream = Stream.fromIterable(dataIterble);
  stream.listen((event) {
    print(event.toString());
  });
// khi ta muốn lùng dử liệu truyền qua theo 1 t/g nhất định
  Stream<int> streamPeriodic =
      Stream.periodic(const Duration(seconds: 2), (value) {
    return value;
  }).asBroadcastStream(); // this is Single subscription
  // chuyển qua broadcast Stream:
  streamPeriodic.listen((event) {
    print(event.toString());
  });

  streamPeriodic.listen((event) {
    print(event.toString());
  });
  streamPeriodic.listen((event) {
    print(event.toString());
  });
}
