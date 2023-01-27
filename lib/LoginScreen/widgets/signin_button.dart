import 'package:flutter/material.dart';
import 'package:hacknitr_round2/routes/route_path.dart';
import 'package:hacknitr_round2/utils/assets.dart';

import '../../utils/size_config.dart';

Widget SigninButton(BuildContext context){
  return Container(
    padding: EdgeInsets.symmetric(
      // horizontal: _width * 0.11,
      vertical: screenHeight! * 0.08,
    ),
    child: Material(
      // color: Color(0xff567DF4),
      color: Colors.red,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        onTap: () {
          /// TODO: Handle Google Sign In
          // handleGoogleSignIn();
          print("tap");
          Navigator.pushReplacementNamed(context, RoutePath.routeToProfileScreen);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          alignment: Alignment.center,
          height: screenWidth! * 0.12,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAsset.loginGoogle),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    screenWidth! * 0.05, 0, 0, 0),
                child: const Text(
                  "Sign in with Google",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}