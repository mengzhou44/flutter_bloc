 
import 'package:rxdart/rxdart.dart';
 

class CounterBloc {
   int initialCount = 0;
   BehaviorSubject<int> _subject = BehaviorSubject<int>();

   CounterBloc({this.initialCount}){
      _subject = new BehaviorSubject<int>.seeded(this.initialCount);  
  }

  Observable<int> get observable => _subject.stream;

  void increment(){
    initialCount++;
    _subject.sink.add(initialCount);
  }

  void decrement(){
    initialCount--;
    _subject.sink.add(initialCount);
  }
 
  dispose() {
      _subject.close();
  }
}
 