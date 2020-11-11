import 'dart:async';

import 'package:proyect_init/src/BLoC_event/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink; //in
  //For Events
  Stream<int> get counter => _counterStateController.stream; //out

  final _counterEventController = StreamController<CounterEvent>();
  //For State
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    _counter = event.invoke(_counter);
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }

}
