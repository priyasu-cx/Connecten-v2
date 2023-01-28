
import 'package:flutter/material.dart';
import 'package:hacknitr_round2/ProfileScreen/widgets/profile_header.dart';
import 'package:hacknitr_round2/ProfileScreen/widgets/social_links.dart';
import 'package:hacknitr_round2/utils/assets.dart';
import 'package:hacknitr_round2/utils/colors.dart';
import 'package:hacknitr_round2/utils/size_config.dart';
import 'package:hacknitr_round2/widgets/drawer.dart';
import 'package:sliding_switch/sliding_switch.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: const Menu(),
        appBar: AppBar(
          toolbarHeight: screenHeight! * 0.12,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          shadowColor: AppColor.primarybgcolor,
          elevation: 0.0,
          leading: Builder(
            builder: (context) => IconButton(
              splashRadius: 1,
              padding: const EdgeInsets.fromLTRB(30, 40, 0, 25),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: AppColor.arrowcolor),
              alignment: Alignment.centerLeft,
            ),
          ),
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
                    const ProfileHeaderContainer(),
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
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          social(context, 1, ImageAsset.linkedinlogo, "Linkedin",
                              "link"),
                          social(context, 2, ImageAsset.githublogo, "Github",
                              "link"),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          social(context, 3, ImageAsset.websitelogo, "Portfolio",
                              "link"),
                          social(context, 4, ImageAsset.twitterlogo, "Twitter",
                              "link"),
                        ]),
                    SizedBox(
                      height: screenHeight! * 0.02,
                    ),
                    Text(
                      "Click to edit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}




