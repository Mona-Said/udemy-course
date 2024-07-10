import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/firebase_options.dart';
import 'package:src/layout/news_app/cubit/states2.dart';
import 'package:src/layout/shop_app/cubit/cubit.dart';
import 'package:src/layout/social_app/cubit/cubit.dart';
import 'package:src/layout/social_app/social_layout_screen.dart';
import 'package:src/shared/bloc_observer.dart';
import 'package:src/shared/components/constants.dart';
import 'package:src/shared/network/local/cache_helper.dart';
import 'package:src/shared/network/remote/dio_helper_news_app.dart';
import 'package:src/shared/network/remote/dio_helper_shop_app.dart';
import 'package:src/shared/styles/themes.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/cubit/cubit2.dart';
import 'modules/social_app/social_login/social_login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  ShopDioHelper.shopInit();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  Widget widget;
  //bool? onBoarding = CacheHelper.getData(key:'onBoarding');
  //token = CacheHelper.getData(key:'token');
  uId = CacheHelper.getData(key: 'uId');
  //print(token);

  // if(onBoarding!=null)
  // {
  //   if(token!=null)
  //   {
  //     widget = const ShopLayoutScreen();
  //   }else {
  //     widget = ShopLoginScreen();
  //   }
  // }else{
  //   widget = const OnboardingScreen();
  // }

  if (uId != null) {
    widget = const SocialLayoutScreen();
  } else {
    widget = SocialLoginScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;

  const MyApp({
    super.key,
    this.isDark,
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()..getBusiness(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              DarkCubit()..changeAppMode(fromShared: isDark),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopCubit()
            ..getHomeData()
            ..getCategoriesData()
            ..getFavoritesData()
            ..getUserData(),
        ),
        BlocProvider(
          create: (BuildContext context) => SocialLayoutCubit()..getUserData(),
        ),
      ],
      child: BlocConsumer<DarkCubit, DarkStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: DarkCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}

//onBoarding != null && onBoarding! ? ShopLoginScreen() : OnboardingScreen()
