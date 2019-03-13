class LoginPending {
  final context;
  final Map<String, String> payload;
  LoginPending({this.payload, this.context});
}

class LoginSuccess {
  // final String payload;
  LoginSuccess();
}

class LoginFail {
  LoginFail();
}
