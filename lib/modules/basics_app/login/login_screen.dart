import 'package:flutter/material.dart';
import 'package:src/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPasswordTrue = true;
  var keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: Padding(
         padding: const EdgeInsets.all(25.0),
         child: SizedBox(
           width: double.infinity,
           child: SingleChildScrollView(
             child: Form(
               key: keyForm,
               child: Column(
                 children:
                 [
                   Container(
                     child: const Stack(
                       alignment: AlignmentDirectional.bottomCenter,
                       children: [
                         SafeArea(
                           child: Image(
                             image: NetworkImage(
                               'https://img.freepik.com/free-vector/computer-login-concept-illustration_114360-7962.jpg?w=740&t=st=1688402142~exp=1688402742~hmac=7d612b2381dff38f5ccb3d950113b1b5fbb69991596c5e356be18989ba498d88',
                             ),
                             height: 250.0,
                             width: 250.0,
                             fit: BoxFit.cover,
                           ),
                         ),
                         Text(
                           'Welcome back!',
                           style: TextStyle(
                             fontSize: 25.0,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(
                     height: 10.0,
                   ),
                   const Text(
                     'Log in to your existent account of QI Allure  ',
                     style: TextStyle(
                       fontSize: 15.0,
                       color: Colors.grey,
                     ),
                   ),
                   const SizedBox(
                     height: 40.0,
                   ),
                   formField(
                     controller: emailController,
                     label: 'Email',
                     type: TextInputType.emailAddress,
                     prefix: Icons.person,
                     function: (String? value)
                     {
                       if(value!.isEmpty)
                           {
                              return 'Email can not be found';
                            }
                            return null;
                     },
                   ),
                   const SizedBox(
                     height: 20.0,
                   ),
                   formField(
                       controller: passwordController,
                       isPassword: isPasswordTrue,
                       label: 'Password',
                       type: TextInputType.visiblePassword,
                       prefix: Icons.lock,
                       suffix: isPasswordTrue? Icons.visibility_off : Icons.visibility,
                       pressed: ()
                       {
                         setState(()
                         {
                           isPasswordTrue = ! isPasswordTrue;
                         });
                       },
                       function: (String? value)
                       {
                         if(value!.isEmpty)
                         {
                           return'Password is too short';
                         }
                         return null;
                       }
                   ),
                   const SizedBox(
                     height: 10.0,
                   ),
                   Container(
                     alignment: AlignmentDirectional.centerEnd,
                     child: const Text(
                       'Forgot Password?',
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 13.0,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                   ),
                   const SizedBox(
                     height: 40.0,
                   ),
                   defaultButton(
                     text: 'LOGIN',
                     function: ()
                     {
                       if(keyForm.currentState!.validate())
                       {
                         print(emailController.text);
                         print(passwordController.text);
                       }
                     },
                     width: 170.0,
                   ),
                   const SizedBox(
                     height: 10.0,
                   ),
                    Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       const Text(
                         'Don\'t have an account?',
                       ),
                       TextButton(onPressed:(){},
                         child:const Text(
                           'Register Now'
                       ),),
                     ],
                   ),
                 ],
               ),
             ),
           ),
         ),
       ),
    );
  }
}
