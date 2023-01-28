import 'package:flutter/material.dart';
import 'package:hacknitr_round2/ProfileScreen/widgets/profile_header.dart';
import 'package:hacknitr_round2/ProfileScreen/widgets/social_cards.dart';
import 'package:hacknitr_round2/ProfileScreen/widgets/social_links.dart';
import 'package:hacknitr_round2/utils/assets.dart';
import 'package:hacknitr_round2/utils/colors.dart';
import 'package:hacknitr_round2/utils/size_config.dart';
import 'package:hacknitr_round2/widgets/appbar.dart';
import 'package:hacknitr_round2/widgets/drawer.dart';
import 'package:sliding_switch/sliding_switch.dart';

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
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      alignment: Alignment.topRight,
                      child: SlidingSwitch(
                        value: false,
                        width: 50,
                        onChanged: (bool value) {
                          /// TODO: Uncomment Required

                          // if (value == true) {
                          //   cp.enableAdvertising(sp.uid);
                          //   cp.disableDiscovery();
                          // } else {
                          //   cp.disableAdvertising();
                          //   cp.enableDiscovery(sp.uid, context);
                          // }
                        },
                        height: 25,
                        animationDuration: const Duration(milliseconds: 400),
                        onTap: () {},
                        onDoubleTap: () {},
                        onSwipe: () {},
                        textOff: "",
                        textOn: "",
                        contentSize: 17,

                        /// TODO: Changes Required
                        colorOn: const Color(0xff035e00),
                        colorOff: const Color(0xfff00c0c),
                        background: const Color(0xff25ff00),
                        buttonColor: const Color(0xfff7f5f7),
                        inactiveColor: const Color(0xff636f7b),
                      ),
                    ),

                    //Stack 2
                    const ProfileHeaderWidget(),
                  ],
                ),
              ),
              Text(
                "My Links",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              socialCard(context),
            ],
          ),
        ));
  }
}
