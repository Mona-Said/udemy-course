import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/layout/social_app/cubit/cubit.dart';
import 'package:src/layout/social_app/cubit/states.dart';
import 'package:src/shared/components/components.dart';

class SocialLayoutScreen extends StatelessWidget {
  const SocialLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLayoutCubit,SocialLayoutStates>(
      listener: (context,state) {},
      builder: (context, state)
      {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Home',
            ),
          ),
          body:  ConditionalBuilder(
            condition: SocialLayoutCubit.get(context).model != null,
            builder: ( context)
            {
              return Column(
                children:
                [
                  if(!FirebaseAuth.instance.currentUser!.emailVerified)
                    Container(
                    color: Colors.amber.withOpacity(0.6),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0
                      ),
                      child: Row(
                        children:
                        [
                          const Icon(
                              Icons.info_outline
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          const Expanded(
                            child: Text(
                                'Please Verify Your Email'
                            ),
                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                          textButton(
                            text: 'SEND',
                            color: Colors.blueGrey,
                            function: ()
                            {
                              FirebaseAuth.instance.currentUser?.sendEmailVerification()
                                  .then((value)
                              {
                                itemToast(text: 'Check Your Mail', state: ToastStates.success);
                              }).catchError((error)
                              {
                                print(error.toString());
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            fallback: ( context)=> const Center(child: CircularProgressIndicator(
              color: Colors.blueGrey,
            )),
          ),
        );
      },
    );
  }
}
