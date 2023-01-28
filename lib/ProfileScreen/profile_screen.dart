
import 'package:flutter/material.dart';
import 'package:hacknitr_round2/utils/assets.dart';
import 'package:hacknitr_round2/utils/colors.dart';
import 'package:hacknitr_round2/utils/size_config.dart';
import 'package:hacknitr_round2/widgets/drawer.dart';
import 'package:sliding_switch/sliding_switch.dart';

import '../Providers/connection_provider.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var fullname = "TEST NAME";
  var imageUrl = "TEST";
  var designation = "STUDENT TEST";
  var bio = "BIO TEST";

  // Future getdata() async {
  //   final datacount = GetStorage();
  //   fullname = datacount.read("fullname");
  //   designation = datacount.read("designation");
  //   bio = datacount.read("bio");
  //   imageUrl = datacount.read("imageUrl");
  // }

  @override
  Widget build(BuildContext context) {
    // final sp = context.read<SignInProvider>();
    // final cp = context.read<ConnectionProvider>();
    // getdata();

    // setState(() {
    //   cp.enableDiscovery(sp.uid, context);
    // });

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
                  boxShadow: [
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
                    Container(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenWidth! * 0.28,
                            // child: sp.imageUrl == null
                            //     ? Image.asset("assets/animation.gif")
                            //     : CircleAvatar(
                            //   radius: 50,
                            //   backgroundImage: NetworkImage(sp.imageUrl),
                            // ),
                            child: Image.asset(ImageAsset.splashScreenGif),
                          ),
                          SizedBox(
                            height: screenHeight! * 0.01,
                          ),
                          Text(
                            fullname,
                            // "hello",
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight! * 0.01,
                          ),
                          Text(
                            designation,
                            // "designation",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight! * 0.01,
                          ),
                          Text(
                            bio,
                            // "Bios",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      alignment: Alignment.topCenter,
                    ),
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

  Widget social(context, index, image, text, link) {
    return GestureDetector(
        onTap: () {
          openDialog(image, text, index);
        },
        child: Container(
          width: screenWidth! * 0.32,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xffeef7fe),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    height: 25,
                    width: 25,
                  ),
                  SizedBox(height: screenHeight! * 0.01),
                  Text(
                    text,
                    //textAlign: TextAlign.start,
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              )],
          ),
        )
    );

  }

  openDialog(image, text, index) => showDialog(
    context: context,
    builder: (context) {
      // final sp = context.read<SignInProvider>();
      final myController = TextEditingController();
      return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 200,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                      child: Column(children: [
                        Text(
                          text + " Link",
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextFormField(
                          controller: myController,
                          autofocus: true,
                          decoration: InputDecoration(
                              hintText: index == 1
                                  ? "https://www.linkedin.com/"
                                  : index == 2
                                  ? "https://github.com/"
                                  : index == 3
                                  ? "https://yoursite.com/"
                                  : "https://twitter.com/"),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();

                              /// TODO: Add link to database
                              // index == 1
                              //     ? sp.setLinkedIn(myController.text)
                              //     : index == 2
                              //     ? sp.setGithub(myController.text)
                              //     : index == 3
                              //     ? sp.setPortfolio(
                              //     myController.text)
                              //     : sp.setTwitter(
                              //     myController.text);
                              // Get.snackbar("Link Submitted", "");
                            },
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ))
                      ]))),
              Positioned(
                child: CircleAvatar(
                  backgroundColor: Color(0xffced5ff),
                  radius: 50,
                  child: Image.asset(
                    image,
                    height: 40,
                    width: 40,
                  ),
                ),
                top: -50,
              )
            ],
          ));
    },
  );
}
