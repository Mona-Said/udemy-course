import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/models/user/shop_app_model/search_model.dart';
import 'package:src/modules/shop_app/search/cubit/states.dart';
import 'package:src/shared/components/constants.dart';
import 'package:src/shared/network/remote/end_points.dart';

import '../../../../shared/network/remote/dio_helper_shop_app.dart';

class SearchCubit extends Cubit<SearchStates>
{
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;

  void search(String text)
  {
    emit(SearchLoadingState());
    ShopDioHelper.shopPostData(
        url: SEARCH,
        data: {
          'text': text,
        },
      token: token,
    ).then((value)
    {
      model=SearchModel.fromJson(value.data);
      print(value.data);
      emit(SearchSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(SearchErrorState());
    });
  }


}

