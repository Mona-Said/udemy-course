import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/layout/news_app/cubit/states.dart';
import 'package:src/modules/news_app/business/business_screen.dart';
import 'package:src/modules/news_app/science/science_screen.dart';
import 'package:src/modules/news_app/sports/sports_screen.dart';
import 'package:src/shared/network/remote/dio_helper_news_app.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  int currentIndex = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(NewsChangeBottomNavBarState());
  }

  List<dynamic> business = [];

  int businessItemSelected = 0;

  void getItemSelected(index) {
    businessItemSelected = index;
    emit(BusinessItemSelectedState());
  }

  bool isDesktop = false;

  void getLocationDesktop(bool value) {
    isDesktop = value;
    emit(BusinessGetDesktopLocationState());
  }

  void getBusiness() {
    emit(BusinessGetLoadingState());

    if (business.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'business',
        'apiKey': 'ff6a41d64bcb408abb5d14338acf02bf',
      }).then((value) {
        //print(value.data.toString());
        business = value.data['articles'];
        print(business[0]['title']);
        emit(BusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(BusinessErrorState(error.toString()));
      });
    } else {
      emit(BusinessSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(SportsGetLoadingState());

    if (sports.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': 'ff6a41d64bcb408abb5d14338acf02bf',
      }).then((value) {
        // Ensure that articles exist in the response
        if (value.data['articles'] != null &&
            value.data['articles'].isNotEmpty) {
          sports = value.data['articles'];
          print(sports[0]['title']); // Safe access
        } else {
          print("No articles found");
          // Handle empty articles case
        }
        emit(SportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(SportsErrorState(error.toString()));
      });
    } else {
      emit(SportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(ScienceGetLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'science',
        'apiKey': 'ff6a41d64bcb408abb5d14338acf02bf',
      }).then((value) {
        //print(value.data.toString());
        science = value.data['articles'];
        print(science[0]['title']);
        emit(ScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ScienceErrorState(error.toString()));
      });
    } else {
      emit(ScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(value) {
    emit(SearchGetLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': 'ff6a41d64bcb408abb5d14338acf02bf',
    }).then((value) {
      //print(value.data.toString());
      search = value.data['articles'];
      print(search[0]['title']);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState(error.toString()));
    });
  }
}
