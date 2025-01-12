import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/event.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
            fromFirestore: (snapshot, option) =>
                Event.fromFireStore(snapshot.data()),
            toFirestore: (event, _) => event.toFireStore());
  }

  static Future< void> addEventToFireStore(Event event) {
    CollectionReference<Event> collectionRef = getEventCollection();//coleection
    DocumentReference<Event> docRef = collectionRef.doc();//document
    event.id= docRef.id;
    return docRef.set(event);
  }
}
