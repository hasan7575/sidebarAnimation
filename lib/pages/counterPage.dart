import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebaranimation/bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  new Scaffold(
      body: new BlocBuilder<CounterBloc,int>(builder: (context,int counter){
        return Center(
          child: new Text("counter is: $counter",style: new TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w900
          ),),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: (){
          context.bloc<CounterBloc>().add(CounterEvents.increment);
        },
      ),
    );
  }
}
