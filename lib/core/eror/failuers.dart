abstract class Failures {
  String message;

  Failures({required this.message});

  @override
  String toString() {
    return message;
  }
}

class RemoteFailure extends Failures {
  RemoteFailure({required super.message});
}

class LocalFailure extends Failures {
  LocalFailure({required super.message});
}
