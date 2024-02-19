import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/models/user/shop_app_model/login_model.dart';
import 'package:src/modules/shop_app/login/cubit/states.dart';
import 'package:src/shared/network/remote/dio_helper_shop_app.dart';
import 'package:src/shared/network/remote/end_points.dart';

class ShopAppCubit extends Cubit<ShopAppStates>
{
  ShopAppCubit() : super(ShopAppInitialState());

  static ShopAppCubit get(context) => BlocProvider.of(context);

   ShopLoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
})
  {
    emit(ShopAppLoadingState());

    ShopDioHelper.shopPostData(
        url: LOGIN,
        data:
        {
          'email': email,
          'password' : password,
        },
      lang: 'en',
    ).then((value) {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
      print(loginModel?.status);
      print(loginModel?.message);
      print(loginModel?.data?.token);
      emit(ShopAppSuccessState(loginModel!));
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopAppErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(ShopAppChangeVisibilityState());
  }
}