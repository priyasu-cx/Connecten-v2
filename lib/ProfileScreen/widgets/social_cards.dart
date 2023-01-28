import 'package:flutter/material.dart';
import 'package:hacknitr_round2/ProfileScreen/widgets/social_links.dart';
import 'package:hacknitr_round2/utils/assets.dart';
import 'package:hacknitr_round2/utils/size_config.dart';

Widget socialCard(BuildContext context) {
  return Container(
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
  );
}