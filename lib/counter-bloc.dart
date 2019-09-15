import 'dart:async';

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class CounterBloc {
  int _counter = 0;

  final _eventController = StreamController<CounterEvent>();
  final _stateController = StreamController<int>();

  Stream<int> get counter => _stateController.stream;
  
  dispatchEvent(CounterEvent event) {
      _eventController.sink.add(event);
  }

  CounterBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent)
      _counter++;
    else
      _counter--;

    _stateController.sink.add(_counter);
  }

  void dispose() {
    _stateController.close();
    _eventController.close();
  }
}