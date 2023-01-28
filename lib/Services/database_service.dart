import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hacknitr_round2/Models/user_models.dart';

class DatabaseService {
  DatabaseService();

  final _authUser = FirebaseAuth.instance.currentUser;

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<bool> checkUserExists(String uid) async {
    DocumentSnapshot state = await _userCollection.doc(uid).get();
    return state.exists;
  }

  Stream<UserModel> get userDetails {
    return _userCollection.doc(_authUser!.uid).snapshots().map((snapshot) =>
        UserModel.fromMap(snapshot.data() as Map<String, dynamic>?));
  }
}
