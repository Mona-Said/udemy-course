import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/modules/counter_app/counter/cubit/cubit.dart';
import 'package:src/modules/counter_app/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget
{
   const CounterScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer <CounterCubit,CounterStates>
        (
        listener: (context, state)
        {
          // if (state is CounterMinusState){
          //   print('minus state ${state.item}');
          // }
          // if (state is CounterPlusState){
          //   print('plus state ${state.item}');
          // }
        },
        builder: (context, state)
        {
         return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text(
                'Counter',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body:  Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  TextButton(
                    onPressed: ()
                    {
                      CounterCubit.get(context).minus();
                    },
                    child: const Text(
                      'MINUS',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Text(
                      '${CounterCubit.get(context).item}',
                      style: const TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: ()
                    {
                      CounterCubit.get(context).plus();
                    },
                    child: const Text(
                      'PLUS',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ) ,
    );
  }
}
