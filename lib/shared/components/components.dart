import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:src/modules/news_app/web_view/webview_screen.dart';
import 'package:src/shared/cubit/cubit.dart';

import '../../layout/shop_app/cubit/cubit.dart';

Widget defaultButton({
  Color color = Colors.blueAccent,
  double width = double.infinity,
  required String text,
  required VoidCallback function,
}) =>
    SizedBox(
      width: width,
      height: 50.0,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MaterialButton(
          color: color,
          onPressed: function,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

Widget textButton({
  required String text,
  required VoidCallback function,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );

Widget formField({
  required TextEditingController controller,
  required String label,
  required IconData prefix,
  IconData? suffix,
  required TextInputType type,
  required String? Function(String?)? function,
  String? Function(String?)? submit,
  String? Function(String?)? onChanged,
  VoidCallback? pressed,
  VoidCallback? onTap,
  bool isClickable = true,
  bool isPassword = false,
}) =>
    Container(
      width: double.infinity,
      height: 60.0,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40.0),
            ),
          ),
          labelText: label,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: pressed,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
        ),
        keyboardType: type,
        obscureText: isPassword,
        validator: function,
        onTap: onTap,
        enabled: isClickable,
        onFieldSubmitted: submit,
        onChanged: onChanged,
      ),
    );

PreferredSize defaultAppBar({
  required BuildContext context,
  String? label,
  List<Widget>? actions,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          IconlyBroken.arrowLeft2,
        ),
      ),
      title: Text(
        label ?? '',
        style: const TextStyle(fontSize: 23.0),
      ),
      actions: actions,
      titleSpacing: 0.0,
    ),
  );
}

Widget databaseList(Map map, context) => Dismissible(
      key: Key(map['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.cyan,
              child: Text(
                '${map['time']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${map['name']}',
                    style: const TextStyle(fontSize: 18.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '${map['date']}',
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDatabase(
                  status: 'done',
                  id: map['id'],
                );
              },
              icon: const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDatabase(
                  status: 'archived',
                  id: map['id'],
                );
              },
              icon: const Icon(
                Icons.archive,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteDatabase(id: map['id']);
      },
    );

Widget taskBuilder({required List<Map> tasks}) => ConditionalBuilder(
      condition: tasks.isNotEmpty,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => databaseList(tasks[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: tasks.length,
      ),
      fallback: (context) => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              color: Colors.grey,
              size: 100.0,
            ),
            Text(
              'No Tasks Here, Please Add a New Task',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 19.0,
              ),
            ),
          ],
        ),
      ),
    );

Widget newsItemBuilder(article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(url: article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://media.istockphoto.com/id/1065782416/photo/online-news-in-mobile-phone-close-up-of-smartphone-screen-man-reading-articles-in-application.webp?b=1&s=170667a&w=0&k=20&c=3sEfQJpggmkOhFRisDiwqO3GGDNnholVOmA15956ViE='),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: SizedBox(
                height: 120.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget newsScreenBuilder(list, context, {isSearch = false}) =>
    ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => newsItemBuilder(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length,
      ),
      fallback: (context) => isSearch
          ? Container()
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrange,
              ),
            ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 30.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);

void itemToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseColorToast(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { success, warning, error }

Color chooseColorToast(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
  }
  return color;
}

Widget buildProductList(
  model,
  context, {
  bool isOldPrice = true,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 120.0,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage('${model!.image}'),
                  width: 120.0,
                  height: 120.0,
                ),
                if (model.discount != 0 && isOldPrice)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    color: Colors.red,
                    child: const Text(
                      'DISCOUNT',
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.name}',
                    style: const TextStyle(
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        style: const TextStyle(
                          fontSize: 13.0,
                          color: Colors.brown,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      if (model.discount != 0 && isOldPrice)
                        Text(
                          model.oldPrice.toString(),
                          style: const TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changeFavorites(model.id!);
                        },
                        icon: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: (ShopCubit.get(context)
                                          .favorites[model.id!] !=
                                      null &&
                                  ShopCubit.get(context).favorites[model.id!]!)
                              ? Colors.brown
                              : Colors.white,
                          child: Icon(
                            Icons.favorite_border,
                            size: 15.0,
                            color:
                                (ShopCubit.get(context).favorites[model.id!] !=
                                            null &&
                                        ShopCubit.get(context)
                                            .favorites[model.id!]!)
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
