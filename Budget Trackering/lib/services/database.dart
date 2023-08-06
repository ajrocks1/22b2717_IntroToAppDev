import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // collecting reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference total =
      FirebaseFirestore.instance.collection('Total');

  Future updateTotal(int value) async {
    return await total.doc('total').set({'total': value});
  }

  Future updateUserData(String expense, int value) async {
    return await brewCollection.doc(uid).set({
      'expense': expense,
      'value': value,
    });
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(expense: doc['expense'] ?? '', value: doc['value'] ?? 0);
    }).toList();
  }

  // user data from snapshot

  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<DocumentSnapshot> get userData {
    return brewCollection.doc(uid).snapshots();
  }
}
