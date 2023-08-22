import 'dart:async';

class Login {
  StreamController controller;
  Sink get getSink => controller.sink; // sink lấy data
  Stream get getStream => controller.stream; // stream đẩy data ra
  Login(this.controller);

  addValue(String value) {
    getSink.add(value);
  }

  printValue() {
    getStream.listen((event) {
      print(event.toString());
    });
  }

  errorValue() {
    controller.addError("Error");
  }
}

main() {
  StreamController controller = StreamController();

  Login login = Login(controller);

  StreamController stream2 = StreamController();
  stream2.addStream(login.getStream);

  login.addValue("hello world");

  login.printValue();

  controller.close();
}
