import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
   final bool isMale ;
   final int result ;
   final int age ;

    const BMIResult({super.key,
     required this.isMale,
     required this.result,
     required this.age,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 52, 67, 140.0),
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(39, 52, 67, 200.0),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.teal,
            ),
        ),
        title: const Text(
          'RESULT',
          style: TextStyle(
            color: Colors.white,
          ),
        ),

      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'Gender : ${isMale? 'Male' : 'Female'}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30.0
              ),
            ),
            Text(
              'Result :$result',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
            Text(
              'Age : $age',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
          ],

        ),
      ),
    );
  }
}
