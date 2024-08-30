import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:src/models/social_app_model/message_model.dart';
import '../../../layout/social_app/cubit/cubit.dart';
import '../../../layout/social_app/cubit/states.dart';
import '../../../models/social_app_model/create_user_model.dart';

class ChatDetailsScreen extends StatelessWidget {
  CreateUserModel? model;

  var messageController = TextEditingController();

  ChatDetailsScreen({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        SocialLayoutCubit.get(context).getMessage(receiverId: model!.uId!);

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
                    Expanded(
                        child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var message =
                            SocialLayoutCubit.get(context).messages[index];
                        if (message.senderId ==
                            SocialLayoutCubit.get(context).userModel?.uId) {
                          return buildRightMessage(message, context);
                        } else {
                          return buildLeftMessage(message, context);
                        }
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10.0,
                      ),
                      itemCount: SocialLayoutCubit.get(context).messages.length,
                    )),
                    const SizedBox(
                      height: 15.0,
                    ),
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
                                  hintStyle: TextStyle(fontSize: 14.0),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              SocialLayoutCubit.get(context).getImageMessage();
                            },
                            icon: const Icon(
                              IconlyBroken.image,
                              color: Colors.blue,
                              size: 28.0,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          MaterialButton(
                            onPressed: () {
                              if (SocialLayoutCubit.get(context).imageMessage ==
                                  null) {
                                SocialLayoutCubit.get(context).sendMessage(
                                  receiverId: model!.uId!,
                                  dateTime: DateTime.now().toString(),
                                  text: messageController.text,
                                );
                              } else {
                                SocialLayoutCubit.get(context)
                                    .uploadImageMessage(
                                  dateTime: DateTime.now().toString(),
                                  receiverId: model!.uId!,
                                  text: messageController.text,
                                );
                              }
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
      },
    );
  }

  Widget buildLeftMessage(MessageModel model, context) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
            ),
          ),
          child: model.image != null && model.image!.isNotEmpty
              ? Container(
                  height: 200.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    image: model.image!.startsWith('http')
                        ? DecorationImage(
                            image: NetworkImage(model.image!),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: FileImage(File(model.image!)),
                            fit: BoxFit.cover,
                          ),
                  ),
                )
              : Text('${model.text}'),
        ),
      );

  Widget buildRightMessage(MessageModel model, context) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: const BorderRadiusDirectional.only(
              bottomStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
            ),
          ),
          child: model.image != null && model.image!.isNotEmpty
              ? Container(
                  height: 200.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    image: model.image!.startsWith('http')
                        ? DecorationImage(
                            image: NetworkImage(model.image!),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: FileImage(File(model.image!)),
                            fit: BoxFit.cover,
                          ),
                  ),
                )
              : Text('${model.text}'),
        ),
      );
}
