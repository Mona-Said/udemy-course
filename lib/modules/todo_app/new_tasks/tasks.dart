import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/shared/components/components.dart';
import 'package:src/shared/cubit/cubit.dart';
import 'package:src/shared/cubit/states.dart';

class NewTasks extends StatelessWidget {
  const NewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          var tasks = AppCubit.get(context).newTasks;

          return taskBuilder(tasks: tasks);
        }
    );
  }
}
