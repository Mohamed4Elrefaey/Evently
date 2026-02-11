import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/providers/EventProvider.dart';
import 'package:evently/models/Event_model.dart';
import 'package:evently/models/User.dart';
import 'package:firebase_auth/firebase_auth.dart' as MyUser;
import 'package:provider/provider.dart';

class FirestoreManager {


  static CollectionReference<User> getUserCollection() {
    // Create object from Firestore (Singleton) and create Collection with name User
    var collection = FirebaseFirestore.instance
        .collection("User")
        .withConverter(
          // use it to convert map to object
          fromFirestore: (snapshot, options) {
            // take data from snapshot
            Map<String, dynamic>? data = snapshot.data();
            return User.fromFireStore(data);
          },
          toFirestore: (user, options) {
            return user.toFireStore();
          },
        ); // return collectionReference
    return collection;
  }

  static CollectionReference<Event> getEventCollection() {
    var collection = FirebaseFirestore.instance
        .collection("Events")
        .withConverter(
          fromFirestore: (snapshot, options) {
            Map<String, dynamic>? data = snapshot.data();
            return Event.fromFirestore(data);
          },
          toFirestore: (event, options) {
            return event.toFirestore();
          },
        );
    return collection;
  }

  static Future<bool> isUserExists(String useId) async{
    var collection = getUserCollection();
    var doc = await collection.doc(useId).get();
    return doc.exists;
  }

  static Future<void> updateEvent({required Event event}){
    var collection = getEventCollection() ;
    var doc = collection.doc(event.id);
    return doc.update(event.toFirestore());
  }


  static Future<void> addUser({required String userId, required User user}) {
    var collection = getUserCollection();
    // must create the doc with the same auth id
    var doc = collection.doc(
      userId,
    ); // return DocumentReference <Map<String , dynamic>>
    return doc.set(user);
  }

  static Future<User?> getUser() async {
    var collection = getUserCollection(); // this Function return collection
    var doc = collection.doc(MyUser.FirebaseAuth.instance.currentUser!.uid);
    var snapshot = await doc.get(); // document نسخة من
    return snapshot.data();
  }

  static Future<void> addEvent({required Event event}) {
    var collection = getEventCollection();
    var doc = collection.doc();
    event.id = doc.id;
    return doc.set(event); // Future
  }

  static Future<void> deleteEvent({required String? eventId}){
    var collection = getEventCollection();
    var doc = collection.doc(eventId);
    return doc.delete();
  }

  // get all events from firestore
  static Future<List<Event>> getAllEvents() async {
    var collection = getEventCollection(); // access collection
    var querySnapshot = await collection.get(); // get all docs
    var docsList = querySnapshot.docs; // List of Query's
    // Convert docs to events
    List<Event> events = docsList.map((document) => document.data()).toList();
    return events;
  }

  // get all events realTime
  static Stream<List<Event>> getAllEventsStream() async* {
    var collection = getEventCollection();
    var querySnapshotStream = collection.snapshots();
    var docsListStream = querySnapshotStream.map(
      (querySnapshots) => querySnapshots.docs,
    );
    var eventListStream = docsListStream.map(
      (docs) => docs.map((event) => event.data()).toList(),
    );
    yield* eventListStream;
  }

  // get Specific events from firestore realTime
  static Stream<List<Event>> getTypeEventsStream(String type) async* {
    var collection = getEventCollection();
    var querySnapshotStream = collection
        .where("type", isEqualTo: type)
        .snapshots();
    var docsListStream = querySnapshotStream.map(
      (querySnapshots) => querySnapshots.docs,
    );
    var eventListStream = docsListStream.map(
      (docs) => docs.map((event) => event.data()).toList(),
    );
    yield* eventListStream;
  }

  // get Specific events from firestore
  static Future<List<Event>> getTypeEvents(String type) async {
    var collection = getEventCollection(); // access collection
    var querySnapshot = await collection
        .where("type", isEqualTo: type)
        .get(); // get all docs
    var docsList = querySnapshot.docs; // List of Query's
    // Convert docs to events
    List<Event> events = docsList.map((document) => document.data()).toList();
    return events;
  }

  // create favorite collection into user document
  static CollectionReference<Event> getFavoriteCollection() {
    var collection = getUserCollection(); // access Users collection
    var doc = collection.doc(
      MyUser.FirebaseAuth.instance.currentUser!.uid,
    ); // Access user document
    var favoriteCollection = doc
        .collection("favorite")
        .withConverter(
          fromFirestore: (snapshot, options) {
            Map<String, dynamic>? data = snapshot.data();
            return Event.fromFirestore(data);
          },
          toFirestore: (event, options) {
            return event.toFirestore();
          },
        );
    return favoriteCollection;
  }
  // add favorite event to favorite collection into user document
  static Future<void> addFavoriteEvent({required Event event}) {
    var collection = getFavoriteCollection();
    var doc = collection.doc(event.id);
    return doc.set(event);
  }

  static Future<void> removeFavoriteEvent({required Event event}) {
    var collection = getFavoriteCollection();
    var doc = collection.doc(event.id);
    return doc.delete();
  }

  static Future<void> updateUserFavorite(List<String> newFavorite) {
    var collection = getUserCollection();
    var doc = collection.doc(MyUser.FirebaseAuth.instance.currentUser!.uid); // access current user
    return doc.update({"favorite": newFavorite});
  }

  static Stream<List<Event>> getFavoriteEventList()async*{
    var collection = getFavoriteCollection();
    var querySnapshotStream = collection.snapshots();
    var docsListStream = querySnapshotStream.map(
          (querySnapshots) => querySnapshots.docs,
    );
    var eventListStream = docsListStream.map(
          (docs) => docs.map((event) => event.data()).toList(),
    );
    yield* eventListStream;
  }

}
