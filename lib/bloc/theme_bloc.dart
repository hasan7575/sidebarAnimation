import 'package:bloc/bloc.dart';

enum CounterEvents{
  increment,
  decrement
}

class CounterBloc extends Bloc<CounterEvents,int>{
  CounterBloc(int initialState) : super(initialState);

//  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvents event) async*{

    if(event==CounterEvents.increment){
     yield state+1;
    }else{
     yield state-1;
    }
  }

}