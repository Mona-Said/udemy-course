import 'package:flutter/material.dart';

import '../../../models/user/user_model.dart';



class UserModelScreen extends StatelessWidget {
   UserModelScreen({super.key});

   List<Models> item =[
     Models(
         id: 1,
         name: 'Mona Said',
         phone: '+201228940932',
     ),
     Models(
         id: 2,
         name: 'Lobna Abdelmoaty ',
         phone: '+201458940932',
     ),
     Models(
         id: 3,
         name: 'Menna Ahmed',
         phone: '+201228956032',
     ),
     Models(
       id: 4,
       name: 'Mona Said',
       phone: '+201228940932',
     ),
     Models(
       id: 5,
       name: 'Lobna Abdelmoaty ',
       phone: '+201458940932',
     ),
     Models(
       id: 6,
       name: 'Menna Ahmed',
       phone: '+201228956032',
     ),
     Models(
       id: 7,
       name: 'Mona Said',
       phone: '+201228940932',
     ),
     Models(
       id: 8,
       name: 'Lobna Abdelmoaty ',
       phone: '+201458940932',
     ),
     Models(
       id: 9,
       name: 'Menna Ahmed',
       phone: '+201228956032',
     ),
     Models(
       id: 10,
       name: 'Mona Said',
       phone: '+201228940932',
     ),
     Models(
       id: 11,
       name: 'Lobna Abdelmoaty ',
       phone: '+201458940932',
     ),
     Models(
       id: 12,
       name: 'Menna Ahmed',
       phone: '+201228956032',
     ),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users Application',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions:  [
          Container(
            padding: const EdgeInsetsDirectional.only(
              end: 15.0,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,

            ),
          ),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context , index) => buildModel(item[index]),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 25.0

            ),
            child: Container(
              width: double.infinity,
              height: 1.5,
              color: Colors.grey[400],
            ),
          ),
          itemCount: item.length),
    );
  }

  Widget buildModel(Models model) =>  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.amber,
          child: Text(
            '${model.id}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Text(
              model.phone,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
