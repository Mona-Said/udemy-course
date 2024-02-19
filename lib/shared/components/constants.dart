// https://newsapi.org/v2/everything?q=tesla&apiKey=abdea69a40a24a64be364ed51325ba9f


import 'package:src/modules/shop_app/login/shop_login_screen.dart';
import 'package:src/shared/components/components.dart';
import 'package:src/shared/network/local/cache_helper.dart';

void logOut (context)
{
  CacheHelper.deleteData(key:'token').then((value){
    if(value!)
    {
      navigateAndFinish(context, ShopLoginScreen());
    }

  });
}

String? token ='';
String? uId ='';