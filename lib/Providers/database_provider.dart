import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacknitr_round2/Services/database_service.dart';

final databaseProvider = Provider<DatabaseService>((ref) => DatabaseService());

final checkUserExistsProvider =
    FutureProvider.family<bool, String>((ref, uid) async {
  // return ref.watch(databaseProvider.checkUserExists(uid));
  return ref.watch(databaseProvider).checkUserExists(uid);
});
