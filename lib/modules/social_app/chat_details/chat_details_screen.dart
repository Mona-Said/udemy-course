import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../layout/social_app/cubit/cubit.dart';
import '../../../layout/social_app/cubit/states.dart';
import '../../../models/social_app_model/create_user_model.dart';

class ChatDetailsScreen extends StatelessWidget {
  CreateUserModel? model;

  var messageController = TextEditingController();

  ChatDetailsScreen({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLayoutCubit, SocialLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0.0,
            title: Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(model!.image!),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Text(
                  model!.name!,
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(10.0),
                        topEnd: Radius.circular(10.0),
                        topStart: Radius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'hello my friend',
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(10.0),
                        topEnd: Radius.circular(10.0),
                        topStart: Radius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'hello my friend',
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.grey.withOpacity(.3),
                      width: 1.0,
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.only(start: 10.0),
                          child: TextFormField(
                            controller: messageController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'type your message here...',
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          SocialLayoutCubit.get(context).sendMessage(
                            receiverId: model!.uId!,
                            dateTime: DateTime.now().toString(),
                            text: messageController.text,
                          );
                        },
                        color: Colors.blue,
                        height: 55.0,
                        minWidth: 1.0,
                        child: const Icon(
                          IconlyBroken.send,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
