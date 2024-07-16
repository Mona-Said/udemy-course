import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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

  CreateUserModel? userModel;

  void getUserData() {
    emit(SocialLayoutCreateUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      userModel =
          CreateUserModel.fromJson(value.data() as Map<String, dynamic>);
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

  File? profileImage;
  File? coverImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialGetProfileImageSuccessState());
    } else {
      print('no image picked');
      emit(SocialGetProfileImageErrorState());
    }
  }

  Future<void> getCoverImage() async {
    final pickedCover = await picker.pickImage(source: ImageSource.gallery);
    if (pickedCover != null) {
      coverImage = File(pickedCover.path);
      emit(SocialGetCoverImageSuccessState());
    } else {
      print('no image picked');
      emit(SocialGetCoverImageErrorState());
    }
  }

  void uploadProfileImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SocialUploadProfileImageSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(SocialUploadProfileImageErrorState());
    });
  }

  void uploadCoverImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SocialUploadCoverImageSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(SocialUploadCoverImageErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(SocialUploadCoverImageErrorState());
    });
  }

  void updateUserData({
    required String name,
    required String phone,
    required String bio,
  }) {
    CreateUserModel model = CreateUserModel(
      name: name,
      phone: phone,
      bio: bio,
      image: userModel?.image,
      cover: userModel?.cover,
      uId: userModel?.uId,
      email: userModel?.email,
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel?.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(SocialUpdateUserDataErrorState());
    });
  }
}
