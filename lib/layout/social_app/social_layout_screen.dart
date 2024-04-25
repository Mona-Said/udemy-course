import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:src/layout/social_app/cubit/cubit.dart';
import 'package:src/layout/social_app/cubit/states.dart';
import 'package:src/shared/components/components.dart';

import '../../modules/social_app/posts/addpost_screen.dart';

class SocialLayoutScreen extends StatelessWidget {
  const SocialLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SocialLayoutCubit.get(context);
    return BlocConsumer<SocialLayoutCubit, SocialLayoutStates>(
      listener: (context, state) {
        if (state is SocialAddPostState) {
          navigateTo(context, const AddPostScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(IconlyBroken.notification),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyBroken.search,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            selectedItemColor: Colors.blue,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.chat,
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.paperUpload,
                ),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.location,
                ),
                label: 'Users',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.setting,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
