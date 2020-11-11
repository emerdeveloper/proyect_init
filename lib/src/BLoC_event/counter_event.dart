
abstract class CounterEvent {
  int invoke(int number);
 }

class IncrementEvent implements CounterEvent {
  @override
  int invoke(int number) {
    return _add(number);
  }
  int _add(int number) {
    return ++number;
  }
}

class DecrementEvent implements CounterEvent {
  @override
  int invoke(int number) {
    return _substract(number);
  }
  int _substract(int number) {
    return --number;
  }
 }

class ResetEvent implements CounterEvent {
  @override
  int invoke(int number) {
    return _reset(number);
  }
  int _reset(int number) {
    return 0;
  }
}