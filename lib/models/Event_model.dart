import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Event {
  String? type;
  String? id;
  String? userId;
  String? desc;
  String? title;
  Timestamp? dateOfTime;

  Event({this.id, this.userId, this.type, this.title, this.desc, this.dateOfTime});

  Event.fromFirestore(Map<String, dynamic>? data) {
    id = data?["id"];
    type = data?["type"];
    title = data?["title"];
    desc = data?["description"];
    dateOfTime = data?["date"];
    userId = data?["userId"];
  }

   Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "type": type,
      "title": title,
      "description": desc,
      "date": dateOfTime,
      "userId": userId,
    };
  }
}
