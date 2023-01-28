import 'package:flutter/material.dart';
import 'package:hacknitr_round2/Models/user_models.dart';
import 'package:hacknitr_round2/utils/size_config.dart';

Widget social(context, index, image, text, link) {
  openDialog(image, text, index) => showDialog(
    context: context,
    builder: (context) {
      // final sp = context.read<SignInProvider>();
      // UserModel userdetails = UserModel();
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