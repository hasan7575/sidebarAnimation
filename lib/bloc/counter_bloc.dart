import 'package:bloc/bloc.dart';


enum CounterEvents{
  increment,
  decrement,
}


class CounterBloc extends Bloc<CounterEvents,int>{
  CounterBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(CounterEvents event) async*{

    if(event==CounterEvents.increment){
      yield state+1;
    }else if(event==CounterEvents.decrement){
      yield state-1;
    }
  }

}