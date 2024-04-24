import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ChatProvider with ChangeNotifier {
  sendMessage(controller, docId, receivedBy, sendBy) async {
    await FirebaseFirestore.instance
        .collection('Chat')
        .doc(docId)
        .collection('chat')
        .doc()
        .set({
      'message': controller,
      'sendBy': sendBy,
      'createdAt': DateTime.now().toIso8601String(),
      'receivedBy': receivedBy
    });
  }

  getMessages(docId)  {
     FirebaseFirestore.instance
        .collection('Chat')
        .doc(docId)
        .collection('chat')
        .snapshots();
  }
}
