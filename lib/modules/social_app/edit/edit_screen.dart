import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../layout/social_app/cubit/cubit.dart';
import '../../../layout/social_app/cubit/states.dart';
import '../../../shared/components/components.dart';

class EditScreen extends StatelessWidget {
  EditScreen({super.key});

  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLayoutCubit, SocialLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialLayoutCubit.get(context).model;
        var profileImage = SocialLayoutCubit.get(context).profileImage;
        var coverImage = SocialLayoutCubit.get(context).coverImage;

        nameController.text = cubit!.name!;
        phoneController.text = cubit.phone!;
        bioController.text = cubit.bio!;
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            label: 'Edit Profile',
            actions: [
              textButton(
                text: 'UPDATE',
                color: Colors.blue,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                function: () {},
              ),
              const SizedBox(
                width: 10.0,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 190.0,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                Container(
                                  height: 140.0,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    image: DecorationImage(
                                        image: coverImage == null
                                            ? NetworkImage('${cubit.cover}')
                                            : FileImage(coverImage)
                                                as ImageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    SocialLayoutCubit.get(context)
                                        .getCoverImage();
                                  },
                                  icon: const CircleAvatar(
                                    radius: 18.0,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      IconlyBroken.camera,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 65,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: CircleAvatar(
                                  radius: 60.0,
                                  backgroundImage: profileImage == null
                                      ? NetworkImage('${cubit.image}')
                                      : FileImage(profileImage)
                                          as ImageProvider,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  SocialLayoutCubit.get(context)
                                      .getProfileImage();
                                },
                                icon: const CircleAvatar(
                                  radius: 18.0,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    IconlyBroken.camera,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  formField(
                    controller: nameController,
                    label: 'Name',
                    prefix: IconlyBroken.user2,
                    type: TextInputType.name,
                    function: (String? value) {
                      if (value!.isEmpty) {
                        return 'name must not be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  formField(
                    controller: phoneController,
                    label: 'Phone',
                    prefix: IconlyBroken.call,
                    type: TextInputType.phone,
                    function: (String? value) {
                      if (value!.isEmpty) {
                        return 'phone must not be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  formField(
                    controller: bioController,
                    label: 'Bio',
                    prefix: IconlyBroken.infoCircle,
                    type: TextInputType.text,
                    function: (String? value) {
                      if (value!.isEmpty) {
                        return 'bio must not be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
