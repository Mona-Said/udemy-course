import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/layout/shop_app/cubit/cubit.dart';
import 'package:src/models/user/shop_app_model/categories_model.dart';
import 'package:src/shared/components/components.dart';

import '../../../layout/shop_app/cubit/states.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener:(context,state){} ,
      builder: (context,state)
      {
        return ListView.separated(
          itemBuilder: (context,index)=>buildCatItem(ShopCubit.get(context).categoriesModel?.data?.data[index]),
          separatorBuilder:(context,index)=>myDivider() ,
          itemCount: ShopCubit.get(context).categoriesModel!.data!.data.length,
        );
      },

    );
  }

  Widget buildCatItem(DataModel? model)=> Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        Image(
          image: NetworkImage('${model?.image}'),
          fit: BoxFit.cover,
          width: 100.0,
          height: 100.0,
        ),
        const SizedBox(
          width: 15.0,
        ),
        Text(
          '${model?.name}',
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
        ),

      ],
    ),
  );
}
