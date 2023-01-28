import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacknitr_round2/Models/user_models.dart';
import 'package:hacknitr_round2/Providers/connection_provider.dart';
import 'package:hacknitr_round2/Providers/database_provider.dart';
import 'package:hacknitr_round2/Services/database_service.dart';
import 'package:hacknitr_round2/utils/size_config.dart';
import 'package:hacknitr_round2/widgets/appbar.dart';
import 'package:hacknitr_round2/widgets/drawer.dart';
import 'package:hacknitr_round2/widgets/profile_dialog.dart';

class NearbyConnect extends ConsumerStatefulWidget {
  const NearbyConnect({Key? key}) : super(key: key);

  @override
  ConsumerState<NearbyConnect> createState() => _NearbyConnectState();
}

class _NearbyConnectState extends ConsumerState<NearbyConnect> {
  // List<Map<String, String?>> allUserData = [];
  // bool isDone = false;

  // Future<Map<String, String?>> fetchUserData(String uid) async {
  //   var userData = new Map<String, String?>();
  //   List<String?> connectedList = [];
  //
  //   await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(uid)
  //       .get()
  //       .then((DocumentSnapshot snapshot) async {
  //     userData["uid"] = snapshot["uid"];
  //     userData["fullname"] = snapshot["fullname"];
  //     userData["designation"] = snapshot["designation"];
  //     userData["bio"] = snapshot["bio"];
  //     userData["imageUrl"] = snapshot["imageUrl"];
  //     userData["linkedIn"] = snapshot["linkedIn"];
  //     userData["github"] = snapshot["github"];
  //     userData["portfolio"] = snapshot["portfolio"];
  //     userData["twitter"] = snapshot["twitter"];
  //     // userData["connectedList"] = snapshot["connectedList"];
  //     var connectedData = snapshot["connectedList"];
  //     connectedList= List<String?>.from(connectedData);
  //   });
  //
  //   return userData;
  // }

  // void getallData(List<String> uidList) async {
  //   List<Map<String, String?>> allData = [];
  //
  //   for (var uid in uidList) {
  //     // Get.snackbar("Uid", uid);
  //     final alphanumeric = RegExp(r'^[a-zA-Z0-9_]*$');
  //     print("Before if "+ uid);
  //     if(alphanumeric.hasMatch(uid) == true){
  //       print(uid);
  //       await fetchUserData(uid).then((value) {
  //         // "^[a-zA-Z0-9_]*$"
  //
  //         allData.add(value);
  //       });
  //     }
  //     //print(uid);
  //
  //   }
  //   setState(() {
  //     isDone = true;
  //     allUserData = allData;
  //   });
  // }

  // @override
  // void initState() {
  //   final cp = context.read<ConnectionProvider>();
  //   if (isDone == false) {
  //     getallData(cp.connections);
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final cp = ref.watch(connectionProvider);
    // final _userdata = ref.watch(nearbyConnectionsProvider);
    print("-------Connection IDs-------");
    print(cp.connections);
    List<UserModel>? nearbyUsers = [];

    // nearbyUsers = _userdata

    return Scaffold(
        drawer: const Menu(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight! * 0.12),
          child: CustomAppbar(context),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(30, 0, 30, 25),
          child: Column(
            children: [
              Text(
                "Nearby Connections",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenHeight! * .02),
              SingleChildScrollView(
                child: Container(
                    height: screenHeight! * 0.6,
                    //height: Get.height*0.5,
                    child: ListView.builder(
                        itemCount: nearbyUsers.length,
                        itemBuilder: (context, i) {
                          //return Connect(userdata["fullname"], userdata["designation"]);

                          return Connect(nearbyUsers[i], nearbyUsers[i].name,
                              nearbyUsers[i].designation, context);
                        })),
              ),
            ],
          ),
        ));
  }
}

class Connect extends ConsumerWidget {
  final UserModel user;
  final String name;
  final String designation;
  
  const Connect(UserModel nearbyUser, {
    Key? key,
    required this.user,
    required this.name,
    required this.designation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        onTap: () {
          ProfileDialog(user, context);
        },
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: EdgeInsets.only(bottom: 20),
            height: screenHeight! * 0.15,
            decoration: BoxDecoration(
              color: Color(0xffEEF7FE),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      //textAlign: TextAlign.start,
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight! * 0.01,
                    ),
                    Text(
                      designation,
                      //textAlign: TextAlign.start,
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () async {
                            // await sp.addConnection(allUserData["uid"]);
                            // Get.snackbar("Connection Added", allUserData["fullname"]);
                          },
                          icon: Icon(Icons.person_add_alt_1_rounded),
                        )),
                  ],
                )
              ],
            )));
  }
}


