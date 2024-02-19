import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/layout/social_app/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:src/shared/components/constants.dart';
import '../../../models/social_app_model/create_user_model.dart';

class SocialLayoutCubit extends Cubit<SocialLayoutStates>
{
  SocialLayoutCubit() : super(SocialLayoutInitialState());

  static SocialLayoutCubit get(context) => BlocProvider.of(context);

  CreateUserModel? model;

  void getUserData()
  {
    emit(SocialLayoutCreateUserLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId).get()
        .then((value)
    {
      print(value.data());
      model = CreateUserModel.fromJson(value.data() as Map<String, dynamic>);
      emit(SocialLayoutCreateUserSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(SocialLayoutCreateUserErrorState());
    });
  }
}