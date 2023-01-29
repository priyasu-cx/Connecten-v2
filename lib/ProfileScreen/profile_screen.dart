import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacknitr_round2/ProfileScreen/widgets/profile_header.dart';
import 'package:hacknitr_round2/ProfileScreen/widgets/social_cards.dart';
import 'package:hacknitr_round2/ProfileScreen/widgets/toggle_button.dart';
import 'package:hacknitr_round2/Providers/database_provider.dart';
import 'package:hacknitr_round2/utils/colors.dart';
import 'package:hacknitr_round2/utils/fluttertoast.dart';
import 'package:hacknitr_round2/utils/size_config.dart';
import 'package:hacknitr_round2/widgets/appbar.dart';
import 'package:hacknitr_round2/widgets/drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Menu(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight! * 0.12),
          child: CustomAppbar(context),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 25),
                height: screenHeight! * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.primarybgcolor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    ToggleButton(),
                    //Stack 2
                    const ProfileHeaderWidget(),
                  ],
                ),
              ),
              MyLinksWidget(),
              socialCard(context),
            ],
          ),
        ));
  }
}

class MyLinksWidget extends ConsumerWidget {
  const MyLinksWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userDetails = ref.watch(userDetailsProvider).value;
    final _databaseUser = ref.watch(databaseProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: screenWidth! * 0.05),
          child: const Text(
            "My Links",
            style: TextStyle(
              letterSpacing: 1,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        InkWell(
          onTap: () {
            _userDetails.isPrivate = !_userDetails.isPrivate;
            _databaseUser.updateUserData(_userDetails);
            _userDetails.isPrivate
                ? toastWidget("Profile Locked")
                : toastWidget("Profile Unlocked");
          },
          child: Icon(
            _userDetails!.isPrivate
                ? Icons.lock_rounded
                : Icons.lock_open_rounded,
            color: _userDetails.isPrivate ? Colors.red : Colors.green,
            size: 30,
          ),
        ),
      ],
    );
  }
}
