import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class MessageBubble extends StatelessWidget {
  final Stream<QuerySnapshot> data = FirebaseFirestore.instance
      .collection('cl')
      .orderBy('createdAt', descending: true)
      .snapshots();

  MessageBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: data,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          // Handle the error
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator
        }

        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;

          return ListView.separated(
            itemBuilder: (context, index) {
              final doc = docs[index];
              var dataMap = doc.data() as Map<String, dynamic>;
              var createdAt = dataMap['createdAt'];
              var text = dataMap['text'];
              var long = dataMap['long'];
              var lat = dataMap['lat'];
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 15, top: 20, bottom: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                      bottomLeft: Radius.circular(32),
                    ),
                  ),
                  child: text != null
                      ? Text(
                    text != null ? text : "--",
                    style: const TextStyle(color: Colors.white),
                  )
                      : Text("Long : $long" + "Lat : $lat"),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 5),
            itemCount: docs.length,
            reverse: true,
            shrinkWrap: true,
          );
        }

        return Container(); // Placeholder widget when data is not available
      },
    );
  }
}
