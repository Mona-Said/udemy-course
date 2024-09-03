import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:src/firebase_options.dart';
import 'package:src/layout/news_app/cubit/states2.dart';
import 'package:src/layout/news_app/news_layout.dart';
import 'package:src/layout/shop_app/cubit/cubit.dart';
import 'package:src/layout/social_app/cubit/cubit.dart';
import 'package:src/layout/social_app/social_layout_screen.dart';
import 'package:src/notifications_helper.dart';
import 'package:src/shared/bloc_observer.dart';
import 'package:src/shared/components/components.dart';
import 'package:src/shared/components/constants.dart';
import 'package:src/shared/network/local/cache_helper.dart';
import 'package:src/shared/network/remote/dio_helper_news_app.dart';
import 'package:src/shared/network/remote/dio_helper_shop_app.dart';
import 'package:src/shared/styles/themes.dart';
import 'package:window_manager/window_manager.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/cubit/cubit2.dart';
import 'modules/social_app/social_login/social_login_screen.dart';

// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print('onBackgroundMessage');
//   print(message.data.toString());
//   itemToast(text: 'onBackgroundMessage', state: ToastStates.success);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  //
  // var tokenApp = await FirebaseMessaging.instance.getToken();
  // //print(tokenApp);
  //
  // FirebaseMessaging.onMessage.listen((event) {
  //   print('on message');
  //   print(event.data.toString());
  //   itemToast(text: 'on message', state: ToastStates.success);
  // });
  //
  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   print('on message opened');
  //   print(event.data.toString());
  //   itemToast(text: 'on message opened', state: ToastStates.success);
  // });
  //
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  //
  // NotificationsHelper.getAccessToken();

  if (Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(600, 400));
  }

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
          create: (BuildContext context) => SocialLayoutCubit()
            ..getUserData()
            ..getPosts(),
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
            home: ScreenTypeLayout(
              mobile: const NewsLayoutScreen(),
              breakpoints: const ScreenBreakpoints(
                desktop: 850.0,
                tablet: 350.0,
                watch: 350.0,
              ),
              desktop: const Text(
                'DESKTOP',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          );
        },
      ),
    );
  }
}

//onBoarding != null && onBoarding! ? ShopLoginScreen() : OnboardingScreen()
