import 'package:flutter/material.dart';
class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://tse4.mm.bing.net/th?id=OIP.Vtxy0FjT_EfudI4cQk1kzAHaE8&pid=Api&P=0&h=180'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,

              ),

            ),
            
          ],
        ),
        actions: [
          IconButton(onPressed: (){},
              icon:  CircleAvatar(
                backgroundColor: Colors.grey[800],
                radius: 20.0 ,
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 18.0,
                ),
              ),),
          IconButton(onPressed: (){},
            icon:  CircleAvatar(
              backgroundColor: Colors.grey[800],
              radius: 20.0 ,
              child: const Icon(
                Icons.edit_sharp,
                color: Colors.white,
                size: 18.0,
              ),
            ),),
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[800],
                ),
                child:  const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
                SizedBox(
                  height: 100.0,
                  child: ListView.separated(
                      itemBuilder: (context , index) => buildStoryItem(),
                      separatorBuilder: (context , index) => const SizedBox(
                        width: 15.0,
                      ),
                      itemCount: 8,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              const SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context , index) => buildChatItem(),
                  separatorBuilder: (context , index) => const SizedBox(
                    height: 15.0,
                  ),
                  itemCount: 20,
                  physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStoryItem() => SizedBox(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://tse4.mm.bing.net/th?id=OIP.Vtxy0FjT_EfudI4cQk1kzAHaE8&pid=Api&P=0&h=180'),
              radius: 30.0,
            ),
            Container(
              padding: const EdgeInsetsDirectional.only(
                bottom: 2.0,
                end: 2.0,
              ),
              child: const CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),

          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        const Text(
          'Mona Said ELsayed Ahmed',
          style: TextStyle(
            color: Colors.white,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          width: 20.0,
        ),

      ],
    ),
  );
  Widget buildChatItem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://tse4.mm.bing.net/th?id=OIP.Vtxy0FjT_EfudI4cQk1kzAHaE8&pid=Api&P=0&h=180'),
            radius: 30.0,
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(
              bottom: 2.0,
              end: 2.0,
            ),
            child: const CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ),

        ],
      ),
      const SizedBox(
        width: 15.0,
      ),
      const Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mona Said',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Hello, my name is mona, i am a senior of this year,okay ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                CircleAvatar(
                  radius: 3.0,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  '12:51 AM',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    ],
  ) ;

}
