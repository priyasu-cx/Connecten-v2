import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacknitr_round2/LoginScreen/login_screen.dart';
import 'package:hacknitr_round2/Providers/auth_providers.dart';
import 'package:hacknitr_round2/Providers/database_provider.dart';

class AuthHandler extends ConsumerWidget {
  const AuthHandler({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);
    return authState.when(data: (value) {
      print("------------------------");
      if (value == null) {
        return const LoginScreen();
      }
      final userExistsState = ref.watch(checkUserExistsProvider(value.uid));
      print("----> REF CREATED <--------");
      // return const HomeScreen();
      AsyncValue<bool> userState = userExistsState;
      print(userState.value);
      return LoginScreen();
    }, error: ((error, stackTrace) {
      print(error);
      return const Center(child: Text('Something went wrong'));
    }), loading: (() {
      return const Center(child: CircularProgressIndicator());
    }));
  }
}
