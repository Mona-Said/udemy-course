import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:src/modules/social_app/edit/edit_screen.dart';
import 'package:src/shared/components/components.dart';

import '../../../layout/social_app/cubit/cubit.dart';
import '../../../layout/social_app/cubit/states.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLayoutCubit, SocialLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialLayoutCubit.get(context).model;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 190.0,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          height: 140.0,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            image: DecorationImage(
                                image: NetworkImage('${cubit?.cover}'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 65,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 60.0,
                          backgroundImage: NetworkImage('${cubit?.image}'),
                        ),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                '${cubit?.name}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 23.0,
                    ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                '${cubit?.bio}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                      fontSize: 11.0,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: const Column(
                          children: [
                            Text('100',
                                style: TextStyle(
                                  fontSize: 17.0,
                                )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Posts',
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: const Column(
                          children: [
                            Text('220',
                                style: TextStyle(
                                  fontSize: 17.0,
                                )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Photos',
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: const Column(
                          children: [
                            Text('10k',
                                style: TextStyle(
                                  fontSize: 17.0,
                                )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Followers',
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: const Column(
                          children: [
                            Text('150',
                                style: TextStyle(
                                  fontSize: 17.0,
                                )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Followings',
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.grey, width: 0.5)),
                          shape: MaterialStateProperty.all(
                            const ContinuousRectangleBorder(
                              borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          )),
                      child: const Text(
                        'Add Photos',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      navigateTo(context, EditScreen());
                    },
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.grey, width: 0.5)),
                        shape: MaterialStateProperty.all(
                          const ContinuousRectangleBorder(
                            borderRadius: BorderRadiusDirectional.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        )),
                    child: const Icon(
                      IconlyBroken.edit,
                      size: 16.0,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
