import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacknitr_round2/Models/user_models.dart';
import 'package:hacknitr_round2/Services/database_service.dart';

final databaseProvider = Provider<DatabaseService>((ref) => DatabaseService());

final checkUserExistsProvider =
    FutureProvider.family<bool, String>((ref, uid) async {
  return ref.watch(databaseProvider).checkUserExists(uid);
});

final userDetailsProvider = StreamProvider<UserModel>(((ref) {
  return ref.watch(databaseProvider).userDetails;
}));

final userDetailsWithIdProvider =
    StreamProvider.family<UserModel, String>(((ref, id) {
  return ref.watch(databaseProvider).userDetailsWithID(id);
}));

final nearbyConnectionsProvider =
    StateProvider.family<List<UserModel>?, List<String>>(((ref, nearbyUsers) {
  return ref.watch(databaseProvider).allConnectionDetails(nearbyUsers);
}));
