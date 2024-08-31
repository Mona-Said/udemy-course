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
import '../../../models/social_app_model/create_post_model.dart';
import '../../../models/social_app_model/create_user_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../models/social_app_model/message_model.dart';

class SocialLayoutCubit extends Cubit<SocialLayoutStates> {
  SocialLayoutCubit() : super(SocialLayoutInitialState());

  static SocialLayoutCubit get(context) => BlocProvider.of(context);

  CreateUserModel? userModel;

  void getUserData() {
    emit(SocialLayoutGetUserDataLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      userModel =
          CreateUserModel.fromJson(value.data() as Map<String, dynamic>);
      emit(SocialLayoutGetUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialLayoutGetUserDataErrorState());
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    const FeedsScreen(),
    const ChatsScreen(),
    AddPostScreen(),
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
    if (index == 1) {
      getAllUsers();
    }
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

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUpdateUserDataLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUserData(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
        );
      }).catchError((error) {
        print(error.toString());
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(SocialUploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUpdateUserDataLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUserData(
          name: name,
          phone: phone,
          bio: bio,
          cover: value,
        );
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
    String? image,
    String? cover,
  }) {
    CreateUserModel model = CreateUserModel(
      name: name,
      phone: phone,
      bio: bio,
      image: image ?? userModel?.image,
      cover: cover ?? userModel?.cover,
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

  File? postImage;

  Future<void> getPostImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SocialGetPostImageSuccessState());
    } else {
      print('no image picked');
      emit(SocialGetPostImageErrorState());
    }
  }

  void deletePostImage() {
    postImage = null;
    emit(SocialDeletePostImageState());
  }

  void uploadPostImage({
    required String dateTime,
    required String text,
  }) {
    emit(SocialCreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createNewPost(
          dateTime: dateTime,
          text: text,
          postImage: value,
        );
      }).catchError((error) {
        print(error.toString());
        emit(SocialCreatePostErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(SocialCreatePostErrorState());
    });
  }

  void createNewPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    emit(SocialCreatePostLoadingState());

    PostModel model = PostModel(
      name: userModel?.name,
      uId: userModel?.uId,
      image: userModel?.image,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? '',
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
      emit(SocialCreatePostSuccessState());
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }

  List<PostModel> posts = [];
  List<String> postId = [];
  List<int> likes = [];

  void getPosts() {
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        element.reference.collection('likes').get().then((value) {
          likes.add(value.docs.length);
          postId.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
        }).catchError((error) {});
      });
      emit(SocialLayoutGetPostsSuccessState());
    }).catchError((error) {
      emit(SocialLayoutGetPostsErrorState());
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel?.uId)
        .set({'like': true}).then((value) {
      emit(SocialLayoutLikePostsSuccessState());
    }).catchError((error) {
      emit(SocialLayoutLikePostsErrorState());
    });
  }

  List<CreateUserModel> users = [];

  void getAllUsers() {
    if (users.isEmpty) {
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) {
          if (element.data()['uId'] != userModel?.uId) {
            users.add(CreateUserModel.fromJson(element.data()));
          }
        });
        emit(SocialLayoutGetAllUsersSuccessState());
      }).catchError((error) {
        emit(SocialLayoutGetAllUsersErrorState());
      });
    }
  }

  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
    String? image,
  }) {
    MessageModel model = MessageModel(
      senderId: userModel?.uId,
      receiverId: receiverId,
      dateTime: dateTime,
      text: text,
      image: image ?? '',
    );

    //send to me
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel?.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SocialLayoutSendMessageSuccessState());
    }).catchError((error) {
      emit(SocialLayoutSendMessageErrorState());
    });

    //send to her
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel?.uId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SocialLayoutSendMessageSuccessState());
    }).catchError((error) {
      emit(SocialLayoutSendMessageErrorState());
    });
  }

  List<MessageModel> messages = [];

  void getMessage({
    required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel?.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(SocialLayoutGetMessageState());
    });
  }

  File? imageMessage;

  Future<void> getImageMessage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageMessage = File(pickedFile.path);
      emit(SocialLayoutImageMessageSuccessState());
    } else {
      print('no image picked');
      emit(SocialLayoutImageMessageErrorState());
    }
  }

  void uploadImageMessage({
    required String dateTime,
    required String receiverId,
    required String text,
  }) {
    if (imageMessage == null) {
      print('No image to upload');
      return;
    }
    emit(SocialLayoutSendMessageLoadingState());
    String fileName = Uri.file(imageMessage!.path).pathSegments.last;
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('messages/$fileName')
        .putFile(imageMessage!)
        .then((taskSnapshot) {
      taskSnapshot.ref.getDownloadURL().then((downloadUrl) {
        sendMessage(
          receiverId: receiverId,
          dateTime: dateTime,
          text: text,
          image: downloadUrl,
        );
        imageMessage = null;
        emit(SocialLayoutSendMessageSuccessState());
      }).catchError((error) {
        print('Error getting download URL: ${error.toString()}');
        emit(SocialLayoutSendMessageErrorState());
      });
    }).catchError((error) {
      print('Error uploading image: ${error.toString()}');
      emit(SocialLayoutSendMessageErrorState());
    });
  }

  final ScrollController scrollController = ScrollController();

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}
