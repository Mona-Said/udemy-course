import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/modules/counter_app/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit(): super(CounterInitialState());

  int item =1;

  static CounterCubit get(context) => BlocProvider.of(context);

  void minus()
  {
    item--;
    emit(CounterMinusState(item));
  }

  void plus()
  {
    item++;
    emit(CounterPlusState(item));
  }



}