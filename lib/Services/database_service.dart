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

  Stream<UserModel> userDetailsWithID(String ID) {
    return _userCollection.doc(ID).snapshots().map((snapshot) =>
        UserModel.fromMap(snapshot.data() as Map<String, dynamic>?));
  }

  // Stream<List<UserModel>?> allConnectionDetails(List<String> nearbyUsers) {
  //   // List<UserModel> nearbyUserData = [];
  //   nearbyUsers.forEach((element) {
  //     _userCollection.doc(element).snapshots().map((snapshot) =>
  //         UserModel.fromMap(snapshot.data() as Map<String, dynamic>?));
  //   });
  //   // return nearbyUserData;
  // }

  Future<bool> addUserData(UserModel userDetails) async {
    _userCollection
        .doc(userDetails.uid)
        .set(userDetails.ToMap(userDetails))
        .onError((error, stackTrace) {
      return false;
    });
    return true;
  }

  Future<void> updateUserData(UserModel userDetails) async {
    _userCollection.doc(userDetails.uid).update(userDetails.ToMap(userDetails));
  }
}
