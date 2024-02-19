import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/layout/news_app/cubit/cubit.dart';
import 'package:src/layout/news_app/cubit/states.dart';
import 'package:src/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state)
      {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body:  Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: formField(
                  controller: searchController,
                  label: 'Search',
                  prefix: Icons.search,
                  type: TextInputType.text,
                  onChanged: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                    return null;
                  },
                  function: (String? value)
                  {
                    if(value!.isEmpty)
                    {
                      return'search can not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(child: newsScreenBuilder(list, context,isSearch: true)),
            ],
          ),

        );
      },
    );
  }
}
