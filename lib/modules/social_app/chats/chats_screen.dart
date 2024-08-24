import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/shared/components/components.dart';
import '../../../layout/social_app/cubit/cubit.dart';
import '../../../layout/social_app/cubit/states.dart';
import '../../../models/social_app_model/create_user_model.dart';
import '../chat_details/chat_details_screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLayoutCubit, SocialLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) => ConditionalBuilder(
        condition: SocialLayoutCubit.get(context).users.isNotEmpty,
        builder: (BuildContext context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildChatItem(
              SocialLayoutCubit.get(context).users[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: SocialLayoutCubit.get(context).users.length,
        ),
        fallback: (BuildContext context) => const Center(
            child: CircularProgressIndicator(
          color: Colors.blue,
        )),
      ),
    );
  }

  Widget buildChatItem(CreateUserModel model, context) => InkWell(
        onTap: () {
          navigateTo(
              context,
              ChatDetailsScreen(
                model: model,
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('${model.image}'),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                '${model.name}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      );
}
