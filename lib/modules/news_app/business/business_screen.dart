import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:src/layout/news_app/cubit/cubit.dart';
import 'package:src/layout/news_app/cubit/states.dart';

import '../../../shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return ScreenTypeLayout.builder(
          mobile: (context) => Builder(
            builder: (context) {
              NewsCubit.get(context).getLocationDesktop(false);

              return newsScreenBuilder(list, context);
            },
          ),
          desktop: (context) => Builder(builder: (context) {
            NewsCubit.get(context).getLocationDesktop(true);

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: newsScreenBuilder(list, context)),
                if (list.isNotEmpty)
                  Expanded(
                      child: Container(
                    color: Colors.grey[100],
                    child: Text(
                        list[NewsCubit.get(context).businessItemSelected]
                            ['description']),
                  )),
              ],
            );
          }),
          breakpoints: const ScreenBreakpoints(
            desktop: 850,
            tablet: 650,
            watch: 400,
          ),
        );
      },
    );
  }
}
