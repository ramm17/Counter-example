import 'package:counter_example/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterSuccessState(count: 0));
  
  int count = 0;

  increment() async{
    emit(CounterLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    count ++;
    emit(CounterSuccessState(count: count));
  }

  decrement() async{
    emit(CounterLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    count --;
    emit(CounterSuccessState(count: count));
  }
}
