
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacknitr_round2/LoginScreen/login_screen.dart';
import 'package:hacknitr_round2/ProfileScreen/profile_screen.dart';
import 'package:hacknitr_round2/Providers/auth_providers.dart';
import 'package:hacknitr_round2/routes/route_path.dart';
import 'package:hacknitr_round2/utils/assets.dart';
import 'package:hacknitr_round2/utils/colors.dart';
import 'package:hacknitr_round2/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

import 'drawer_item.dart';

class Menu extends ConsumerWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authService = ref.watch(authServicesProvider);
    return Drawer(
      child: Material(
        color: AppColor.secbgcolor,
        child: Container(
          margin:
          EdgeInsets.fromLTRB(30, screenHeight! * 0.12, screenWidth! * 0.05, 0),
          child: Column(
            children: [
              HeaderWidget(),

              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight! * 0.03),
                child: const Divider(
                  thickness: 1,
                  height: 10,
                  color: Colors.grey,
                ),
              ),

              DrawerItem(
                name: 'Nearby Connects',
                icon: Icons.people_rounded,
                onPressed: () => onItemPressed(context, index: 0),
              ),
              SizedBox(
                height: screenHeight! * 0.03,
              ),
              DrawerItem(
                name: 'Connections',
                icon: Icons.people,
                onPressed: () => onItemPressed(context, index: 1),
              ),
              SizedBox(
                height: screenHeight! * 0.03,
              ),
              DrawerItem(
                  name: 'Profile',
                  icon: Icons.manage_accounts,
                  onPressed: () => onItemPressed(context, index: 2)),
              SizedBox(
                height: screenHeight! * 0.03,
              ),
              DrawerItem(
                  name: 'Upcoming Events',
                  icon: Icons.event_available,
                  onPressed: () => onItemPressed(context, index: 3)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight! * 0.03),
                child: const Divider(
                  thickness: 1,
                  height: 10,
                  color: Colors.grey,
                ),
              ),
              DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                  onPressed: () {
                    _authService.signOut();
                    Navigator.pushReplacementNamed(
                        context,
                        RoutePath.routeToLoginScreen);
                  }),
              SizedBox(height: screenHeight!*0.13),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.file_copy, color: Colors.black,size: 16,),
                  TextButton(onPressed: (){
                    showLicensePage(context: context, applicationIcon: Image.asset(ImageAsset.applogo, height: 70,),applicationVersion: "1.2.1", applicationLegalese: "Copyright CodingReboot");
                  }, child: Text(
                    "Licenses", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16),
                  ))

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: ()async{
                    var url = Uri.parse("https://pages.flycricket.io/connecten/terms.html");

                    if (await canLaunchUrl(url)) {
                      // LaunchMode.externalApplication;
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  }, child: Text(
                    "Terms & Conditions", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 10),
                  )),
                  SizedBox(width: screenWidth!*0.02),
                  TextButton(onPressed: ()async{

                    var url = Uri.parse("https://pages.flycricket.io/connecten/privacy.html");

                    if (await canLaunchUrl(url)) {
                      // LaunchMode.externalApplication;
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }

                  }, child: Text(
                    "Privacy Policy", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 10),
                  )),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
  void onItemPressed(BuildContext context, {required int index}) {
    // final sp = context.read<SignInProvider>();
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
        break;

      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        break;

      case 4:
      // sp.userSignOut();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
        break;
    }
  }
}


class HeaderWidget extends ConsumerWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authUser = ref.watch(authUserProvider);
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: screenHeight! * 0.055,
            backgroundImage: AssetImage(ImageAsset.applogo),
            foregroundImage: NetworkImage(_authUser!.photoURL!),
          ),
          SizedBox(
            width: screenHeight! * 0.03,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_authUser.displayName ?? "Coding Reboot",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                SizedBox(
                  height: 10,
                ),
                Text(_authUser.email ?? "test@mail.com",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: Colors.black))
              ],
            ),
          )
        ],
      ),
    );
  }
}



