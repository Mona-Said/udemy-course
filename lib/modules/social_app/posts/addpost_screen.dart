import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:src/layout/social_app/cubit/cubit.dart';

import '../../../layout/social_app/cubit/states.dart';
import '../../../shared/components/components.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({
    super.key,
  });

  var postController = TextEditingController();
  var now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLayoutCubit, SocialLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            label: 'Create Post',
            actions: [
              textButton(
                text: 'POST',
                color: Colors.blue,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                function: () {
                  if (SocialLayoutCubit.get(context).postImage == null) {
                    SocialLayoutCubit.get(context).createNewPost(
                      dateTime: now.toString(),
                      text: postController.text,
                    );
                  } else {
                    SocialLayoutCubit.get(context).uploadPostImage(
                      dateTime: now.toString(),
                      text: postController.text,
                    );
                  }
                },
              ),
              const SizedBox(
                width: 10.0,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state is SocialCreatePostLoadingState)
                  const LinearProgressIndicator(
                    color: Colors.blue,
                  ),
                if (state is SocialCreatePostLoadingState)
                  const SizedBox(
                    height: 10.0,
                  ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/premium-psd/picture-bird-tree-with-sunset-background_1142283-309911.jpg?w=740'),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Queen',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: postController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'what is in your mind ...',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                if (SocialLayoutCubit.get(context).postImage != null)
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(
                        height: 140.0,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          image: DecorationImage(
                              image: FileImage(
                                      SocialLayoutCubit.get(context).postImage!)
                                  as ImageProvider,
                              fit: BoxFit.cover),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          SocialLayoutCubit.get(context).deletePostImage();
                        },
                        icon: const CircleAvatar(
                          radius: 18.0,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.close,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          SocialLayoutCubit.get(context).getPostImage();
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              IconlyBroken.image,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'add photo',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          '# tags',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
