import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal ,
        leading: IconButton(onPressed:(){
          print ('mona');
        }, icon: const Icon(
          Icons.access_alarms_sharp,
        )),
        title: const Text(
          'Home Page'
        ),
        actions:  [
          IconButton(onPressed:(){
            print('hello');
          }, icon: const Icon(
            Icons.markunread,
          )),

          const Icon(
            Icons.dark_mode,
          ),
        ],
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 220.0,
              height: 220.0,
              decoration:  const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart:Radius.circular(30.0,),
                  topEnd: Radius.circular(30.0,),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  const Image(
                    image: NetworkImage(
                      'https://tse4.mm.bing.net/th?id=OIP.H6p8utG7Cjz4PIHCDexa8QHaE8&pid=Api&P=0&h=180',
                    ),
                    width: 220.0,
                    height: 220.0,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.7),
                    width: double.infinity,
                    padding:const EdgeInsetsDirectional.only(
                       top: 10.0,
                      bottom: 10.0,
                    ),
                    child: const Text(
                      'Cat',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

      ),

    );

  }

}


