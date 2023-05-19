import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class MessageBubble extends StatelessWidget {

  final Stream<QuerySnapshot> data = FirebaseFirestore.instance.collection('cl').orderBy('createdAt',descending: true).snapshots();

   MessageBubble({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: data,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
    {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Text("Loading");
      }
      final docs = snapshot.data!.docs;

          return   ListView.separated(
            itemBuilder: (context, index) =>
                Align(
                  alignment:  Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 15, top: 20, bottom: 20, right: 20),
                    decoration: BoxDecoration(
                        color:Colors.blue,
                        borderRadius:const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                            bottomLeft: Radius.circular(32)
                        )
                    ),
                    child: Text(docs[index]['text'],
                    style: const TextStyle(color: Colors.white))
                  ),
                ),
            separatorBuilder: (context, index) => const SizedBox(height: 5,),
            itemCount: docs.length,
            reverse: true,
            shrinkWrap: true,
          );


        }
    );
  }

}
