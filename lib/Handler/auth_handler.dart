import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacknitr_round2/FormScreen/form_screen.dart';
import 'package:hacknitr_round2/LoginScreen/login_screen.dart';
import 'package:hacknitr_round2/ProfileScreen/profile_screen.dart';
import 'package:hacknitr_round2/Providers/auth_providers.dart';
import 'package:hacknitr_round2/Providers/database_provider.dart';
import 'package:hacknitr_round2/utils/loading_page.dart';

class AuthHandler extends ConsumerWidget {
  const AuthHandler({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);
    return authState.when(data: (value) {
      if (value == null) {
        return const LoginScreen();
      }
      AsyncValue<bool> userExistsState =
          ref.watch(checkUserExistsProvider(value.uid));
      //  userState = userExistsState;
      if (userExistsState.value == false) {
        return FormScreen();
      } else if (userExistsState.value == true) {
        return ProfileScreen();
      }
      return const LoadingPage();
      // print(userState.value);
      // return LoginScreen();
    }, error: ((error, stackTrace) {
      print(error);
      return const Center(child: Text('Something went wrong'));
    }), loading: (() {
      return const Center(child: CircularProgressIndicator());
    }));
  }
}
