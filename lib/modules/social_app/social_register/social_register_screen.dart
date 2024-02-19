import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/modules/social_app/social_register/cubit/cubit.dart';
import 'package:src/modules/social_app/social_register/cubit/states.dart';
import '../../../layout/social_app/social_layout_screen.dart';
import '../../../shared/components/components.dart';

class SocialRegisterScreen extends StatelessWidget {
   SocialRegisterScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit,SocialRegisterStates>(
        listener: (context,state)
        {
          if(state is SocialCreateUserSuccessState)
          {
            navigateAndFinish(context, const SocialLayoutScreen());
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
                          'REGISTER',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Register now to communicate with your friends',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        formField(
                          controller: nameController,
                          label: 'User Name',
                          prefix: Icons.person,
                          type: TextInputType.name,
                          function: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
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
                            suffix: SocialRegisterCubit.get(context).suffix,
                            isPassword:SocialRegisterCubit.get(context).isPassword ,
                            pressed: ()
                            {
                              SocialRegisterCubit.get(context).changePasswordVisibility();

                            }
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        formField(
                          controller: phoneController,
                          label: 'Phone',
                          prefix: Icons.phone,
                          type: TextInputType.phone,
                          function: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Phone';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialRegisterLoadingState,
                          builder: (BuildContext context) =>  defaultButton(
                            text: 'REGISTER',
                            function: ()
                            {
                              if(keyForm.currentState!.validate())
                              {
                                SocialRegisterCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name:nameController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            color: Colors.blueGrey,
                          ),
                          fallback: (BuildContext context) =>const Center(child: CircularProgressIndicator()),
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
