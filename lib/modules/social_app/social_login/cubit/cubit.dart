import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/modules/social_app/social_login/cubit/states.dart';

class SocialAppCubit extends Cubit<SocialAppStates>
{
  SocialAppCubit() : super(SocialAppInitialState());

  static SocialAppCubit get(context) => BlocProvider.of(context);


  void userLogin({
    required String email,
    required String password,
})
  {
    emit(SocialAppLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value)
    {
      print(value.user?.email);
      print(value.user?.uid);
      emit(SocialAppSuccessState(value.user!.uid));
    }).catchError((error)
    {
      print(error.toString());
      emit(SocialAppErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(SocialAppChangeVisibilityState());
  }
}