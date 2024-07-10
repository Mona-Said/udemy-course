import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/layout/social_app/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:src/modules/social_app/chats/chats_screen.dart';
import 'package:src/modules/social_app/feeds/feeds_screen.dart';
import 'package:src/modules/social_app/posts/addpost_screen.dart';
import 'package:src/modules/social_app/settings/settings_screen.dart';
import 'package:src/modules/social_app/users/users_screen.dart';
import 'package:src/shared/components/constants.dart';
import '../../../models/social_app_model/create_user_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialLayoutCubit extends Cubit<SocialLayoutStates> {
  SocialLayoutCubit() : super(SocialLayoutInitialState());

  static SocialLayoutCubit get(context) => BlocProvider.of(context);

  CreateUserModel? model;

  void getUserData() {
    emit(SocialLayoutCreateUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      model = CreateUserModel.fromJson(value.data() as Map<String, dynamic>);
      emit(SocialLayoutCreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialLayoutCreateUserErrorState());
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    const FeedsScreen(),
    const ChatsScreen(),
    const AddPostScreen(),
    const UsersScreen(),
    const SettingsScreen(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'post',
    'Users',
    'Settings',
  ];

  void changeBottomNav(int index) {
    if (index == 2) {
      emit(SocialAddPostState());
    } else {
      currentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }
}
