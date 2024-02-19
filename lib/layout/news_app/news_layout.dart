import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/layout/news_app/cubit/cubit.dart';
import 'package:src/layout/news_app/cubit/cubit2.dart';
import 'package:src/layout/news_app/cubit/states.dart';
import 'package:src/modules/news_app/search/search_screen.dart';
import 'package:src/shared/components/components.dart';


class NewsLayoutScreen extends StatelessWidget
{
  const NewsLayoutScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state) {  },
        builder: ( context,state)
        {
          var cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'News App',
              ),
              actions: [
                IconButton(
                    onPressed: ()
                    {
                      navigateTo(context, SearchScreen());
                    },
                    icon: const Icon(
                      Icons.search
                ),),
                IconButton(
                    onPressed: ()
                    {
                      DarkCubit.get(context).changeAppMode();
                    },
                    icon: const Icon(
                      Icons.brightness_4_outlined
                ),),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNav(index);
              },
            ),
        );},
        );
  }
}