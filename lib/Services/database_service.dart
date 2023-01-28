import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  DatabaseService();

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<bool> checkUserExists(String uid) async {
    DocumentSnapshot state = await _userCollection.doc(uid).get();
    return state.exists;
  }
}
