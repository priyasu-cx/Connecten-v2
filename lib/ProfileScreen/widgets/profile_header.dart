import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacknitr_round2/Providers/connection_provider.dart';
import 'package:hacknitr_round2/Providers/database_provider.dart';
import 'package:hacknitr_round2/utils/assets.dart';
import 'package:hacknitr_round2/utils/size_config.dart';

class ProfileHeaderWidget extends ConsumerWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _databaseUser = ref.watch(userDetailsProvider);
    return _databaseUser.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text(error.toString()),
        data: (userData) {
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
                  userData.name,
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
                  userData.designation!,
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
                  userData.bio!,
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
        });
  }
}

// class ProfileHeaderContainer extends ConsumerWidget {
//   const ProfileHeaderContainer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final _userDetails = ref.watch(userDetailsProvider);
//     print(_userDetails.value);
//     return Container(
//       padding: const EdgeInsets.all(40),
//       child: Column(
//         children: [
//           SizedBox(
//             height: screenWidth! * 0.28,
//             child: Image.asset(ImageAsset.splashScreenGif),
//           ),
//           SizedBox(
//             height: screenHeight! * 0.01,
//           ),
//           Text(
//             _userDetails.value!.name!,
//             // "hello",
//             style: TextStyle(
//               letterSpacing: 1,
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           SizedBox(
//             height: screenHeight! * 0.01,
//           ),
//           Text(
//             _userDetails.value!.designation!,
//             // "designation",
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//           SizedBox(
//             height: screenHeight! * 0.01,
//           ),
//           Text(
//             _userDetails.value!.bio!,
//             // "Bios",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 13,
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//         ],
//       ),
//       alignment: Alignment.topCenter,
//     );
//   }
// }
