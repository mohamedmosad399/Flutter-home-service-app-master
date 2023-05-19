import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'messagebubble.dart';
class Chat extends StatefulWidget {
  static String id = 'chat';
String ? name;
 Chat({required this.name});
  @override
  State<Chat> createState() => _ChatState();
}
class _ChatState extends State<Chat> {
  final text = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('cl');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1,),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://api-private.atlassian.com/users/360a1eb10427f884ff4af21f5ed67aee/avatar'),
            ),
            const SizedBox(width: 7,),
             Text(widget.name!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            const Spacer(flex: 1,),


          ],),
        elevation: 0,


      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child:MessageBubble()
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: text,
              onSubmitted: (_){
                 users.add({
                  'text' : text.text,
                  'createdAt' : DateTime.now(),

                 });
                 text.clear();
              },
              decoration: InputDecoration(
                  hintText: 'Send Message...',
                  suffixIcon: IconButton(onPressed: (){
                    users.add({
                      'text' : text.text,
                      'createdAt' : DateTime.now(),

                    });
                    text.clear();

                  },icon:const Icon(Icons.arrow_forward_ios_sharp)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
            )

          ],
        ),
      ),
    );
  }
}
