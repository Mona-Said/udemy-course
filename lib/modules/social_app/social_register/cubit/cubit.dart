import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/modules/social_app/social_register/cubit/states.dart';
import '../../../../models/social_app_model/create_user_model.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user?.email);
      print(value.user?.uid);

      userCreate(
        email: email,
        uId: value.user!.uid,
        name: name,
        phone: phone,
      );
    }).catchError((error) {
      print(error.toString());
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String email,
    required String uId,
    required String name,
    required String phone,
  }) {
    CreateUserModel model = CreateUserModel(
      name: name,
      phone: phone,
      email: email,
      uId: uId,
      cover:
          'https://img.freepik.com/free-photo/daisies-envelope_23-2148164101.jpg?t=st=1714178959~exp=1714182559~hmac=fb5ef2db72f9d25f65d835229225d3c1318005cfa6d2535cb96a3a3fbcda8433&w=826',
      image:
          'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg?t=st=1714179064~exp=1714182664~hmac=1e9a8b6e1c5e707c09e8453f4694641b58ce3c62261125425e29968696f20867&w=740',
      bio: 'write your bio...',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(SocialRegisterChangeVisibilityState());
  }
}
