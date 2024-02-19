import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/modules/social_app/social_login/cubit/cubit.dart';
import 'package:src/modules/social_app/social_login/cubit/states.dart';
import '../../../layout/social_app/social_layout_screen.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../social_register/social_register_screen.dart';

class SocialLoginScreen extends StatelessWidget {
   SocialLoginScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SocialAppCubit(),
      child: BlocConsumer<SocialAppCubit,SocialAppStates>(
        listener: (context,state)
        {
          if(state is SocialAppErrorState)
          {
            itemToast(
                text: state.error,
                state: ToastStates.error,
            );
          }
          if(state is SocialAppSuccessState)
            {
              CacheHelper.putData(
                key: 'uId',
                value: state.uId,
              ).then((value)
              {
                navigateAndFinish(context, const SocialLayoutScreen());
              });
            }
        },
        builder: (context,state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: keyForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Login now to communicate with your friends',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        formField(
                          controller: emailController,
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                          type: TextInputType.emailAddress,
                          function: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email Address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        formField(
                            controller: passwordController,
                            label: 'Password',
                            prefix: Icons.lock_outline_rounded,
                            type: TextInputType.visiblePassword,
                            function: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Password';
                              }
                              return null;
                            },
                            submit: (value)
                            {
                              if(keyForm.currentState!.validate())
                              {
                                SocialAppCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                              return null;
                            },
                            suffix: SocialAppCubit.get(context).suffix,
                            isPassword:SocialAppCubit.get(context).isPassword ,
                            pressed: ()
                            {
                              SocialAppCubit.get(context).changePasswordVisibility();

                            }
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialAppLoadingState,
                          builder: (BuildContext context) =>  defaultButton(
                            text: 'LOGIN',
                            function: ()
                            {
                              if(keyForm.currentState!.validate())
                              {
                                SocialAppCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }

                            },
                            color: Colors.blueGrey,
                          ),
                          fallback: (BuildContext context) =>const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                            ),
                            textButton(
                              text: 'REGISTER NOW',
                              function:()
                              {
                                navigateTo(context, SocialRegisterScreen());
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
