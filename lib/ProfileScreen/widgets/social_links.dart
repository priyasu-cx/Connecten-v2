import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacknitr_round2/Models/user_models.dart';
import 'package:hacknitr_round2/Providers/auth_providers.dart';
import 'package:hacknitr_round2/Providers/database_provider.dart';
import 'package:hacknitr_round2/utils/assets.dart';
import 'package:hacknitr_round2/utils/fluttertoast.dart';
import 'package:hacknitr_round2/utils/size_config.dart';

class social extends ConsumerWidget {
  final int index;
  final String image;
  final String text;

  const social({
    Key? key,
    required this.index,
    required this.image,
    required this.text,
  }) : super(key: key);

  openDialog(image, text, index, usermodel, context) => showDialog(
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
                                  index == 1
                                      ? usermodel.linkedin = myController.text
                                      : index == 2
                                      ? usermodel.github = myController.text
                                      : index == 3
                                      ? usermodel.website = myController.text
                                      : usermodel.twitter = myController.text;
                                  toastWidget("Link Added");
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _currentUser = ref.watch(userDetailsProvider);
    final _databaseUser = ref.watch(databaseProvider);
    return GestureDetector(
        onTap: () {
          UserModel userData = openDialog(image, text, index, _currentUser.value,context);
          _databaseUser.updateUserData(userData);
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
              )
            ],
          ),
        ));
  }
}

class openDialog extends ConsumerWidget {
  const openDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder();
  }
}

