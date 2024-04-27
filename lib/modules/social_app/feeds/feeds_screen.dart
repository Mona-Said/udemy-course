import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../layout/social_app/cubit/cubit.dart';
import '../../../layout/social_app/cubit/states.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLayoutCubit, SocialLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: const Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(8.0),
                  elevation: 5.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image(
                        image: NetworkImage(
                          'https://img.freepik.com/free-photo/stylish-good-looking-ambitious-smiling-brunette-woman-with-curly-hairstyle-cross-hands-chest-confident-professional-pose-smiling-standing-casually-summer-outfit-talking-friend-white-wall_176420-36248.jpg?t=st=1713987803~exp=1713991403~hmac=795a7eafbfcecf5c2e2246c4c440216c08dcb1a80fb3d49e17e32c5d93b520b2&w=740',
                        ),
                        fit: BoxFit.cover,
                        height: 200.0,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Communicate with friends',
                          style: TextStyle(color: Colors.blue, fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => buildPostItem(context),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5.0,
                ),
                itemCount: 10,
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildPostItem(context) => Card(
        color: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/premium-psd/smiling-young-brunette-woman-casual-attire-with-natural-confident-expression-looking-away-with-laughter_410516-113925.jpg?w=740'),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Mona Said',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Icon(
                            Icons.check_circle,
                            size: 16.0,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      Text(
                        'January 10,2024 at 10:00 pm',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 18.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 16.0, height: 1.3),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 10.0),
                    child: Container(
                      height: 20.0,
                      child: MaterialButton(
                        onPressed: () {},
                        minWidth: 1.0,
                        padding: EdgeInsets.zero,
                        child: const Text(
                          '#flutter',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 20.0,
                    child: MaterialButton(
                      onPressed: () {},
                      minWidth: 1.0,
                      padding: EdgeInsets.zero,
                      child: const Text(
                        '#software_development',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 140.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://img.freepik.com/free-photo/excited-curly-haired-girl-sunglasses-pointing-right-showing-way_176420-20192.jpg?t=st=1714004011~exp=1714007611~hmac=a9e8567944015a048b34d36d4695d42e4da2e3aa6805f6ca23ed033fe2cabf71&w=740',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          children: [
                            const Icon(
                              IconlyBroken.heart,
                              color: Colors.red,
                              size: 17.0,
                            ),
                            const SizedBox(
                              width: 3.0,
                            ),
                            Text(
                              '120',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.grey,
                                    fontSize: 13.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              IconlyBroken.chat,
                              color: Colors.amber,
                              size: 17.0,
                            ),
                            const SizedBox(
                              width: 3.0,
                            ),
                            Text(
                              '120 comment',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.grey,
                                    fontSize: 13.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 17.0,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/premium-psd/smiling-young-brunette-woman-casual-attire-with-natural-confident-expression-looking-away-with-laughter_410516-113925.jpg?w=740'),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'write a comment...',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                  ),
                  const Spacer(),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          const Icon(
                            IconlyBroken.heart,
                            color: Colors.red,
                            size: 17.0,
                          ),
                          const SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            'Like',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.grey,
                                      fontSize: 13.0,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
