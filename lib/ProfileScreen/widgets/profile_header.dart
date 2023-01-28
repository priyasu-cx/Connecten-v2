import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacknitr_round2/Providers/database_provider.dart';
import 'package:hacknitr_round2/utils/assets.dart';
import 'package:hacknitr_round2/utils/size_config.dart';

class ProfileHeaderContainer extends ConsumerWidget {
  const ProfileHeaderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userDetails = ref.watch(userDetailsProvider);
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          SizedBox(
            height: screenWidth! * 0.28,

            child: Image.asset(ImageAsset.splashScreenGif),
          ),
          SizedBox(
            height: screenHeight! * 0.01,
          ),
          Text(
            "_userDetails.name",
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
            "_authUser.",
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
            "bio",
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
    );
  }
}
