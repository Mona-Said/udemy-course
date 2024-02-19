import 'package:flutter/material.dart';

class WhatsappScreen extends StatelessWidget {
  const WhatsappScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 52, 67, 100.0),
      appBar: AppBar(
        backgroundColor:  Colors.blueGrey[800],
        leading: IconButton(
            onPressed: (){},
            icon:const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20.0,
          top: 20.0,
        ),
        child: SizedBox(
          width: double.infinity,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Stack(
                alignment:AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: 75.0,
                    backgroundColor: Colors.white,
                  ),
                  CircleAvatar(
                    backgroundColor:Colors.teal,
                    radius: 23.0,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.person,
                                    color: Colors.white70,
                                    //size: 30.0,
                                  ),
                                  const SizedBox(
                                    width: 26.0,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name',
                                        style: TextStyle(
                                          color:Colors.blueGrey[300],
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      const Text(
                                        'Mona Said',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                    // const SizedBox(
                                    //   width: 147.0,
                                    // ),
                                  const Spacer(),
                                    IconButton(
                                    alignment: AlignmentDirectional.topEnd,
                                    onPressed: (){},
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 7.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  start: 50.0,
                                  end: 20.0,
                                ),
                                child: Text(
                                  'This is not your username or pin. this name will be visible to your whatsapp contacts.',
                                  style: TextStyle(
                                    color: Colors.blueGrey[300],
                                    fontSize: 13.0,

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 50.0,
                ),
                child: Container(
                  height: 0.5,
                  width: double.infinity,
                  color:Colors.blueGrey[800] ,

                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
               Row(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.white70,
                  ),
                  const SizedBox(
                    width: 26.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(
                          color: Colors.blueGrey[300],
                          fontSize: 15.0,
                        ),
                      ),
                      const Text(
                        'Flutter Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   width: 105.0,
                  // ),
                  const Spacer(),
                  IconButton(
                    alignment: AlignmentDirectional.topEnd,
                    onPressed: (){},
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 13.0,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 50.0,
                ),
                child: Container(
                  height: 0.5,
                  width: double.infinity,
                  color:Colors.blueGrey[800] ,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.white70,
                  ),
                  const SizedBox(
                    width: 26.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone',
                        style: TextStyle(
                          color: Colors.blueGrey[300],
                          fontSize: 15.0,
                        ),
                      ),
                      const Text(
                        '+20 122 743 5483',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
