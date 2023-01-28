import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacknitr_round2/Models/user_models.dart';
import 'package:hacknitr_round2/Providers/auth_providers.dart';
import 'package:hacknitr_round2/Providers/database_provider.dart';
import 'package:hacknitr_round2/routes/route_path.dart';
import 'package:hacknitr_round2/utils/colors.dart';
import 'package:hacknitr_round2/utils/size_config.dart';
import 'package:toast/toast.dart';

class FormScreen extends ConsumerWidget {
  FormScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  // Editing controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ToastContext().init(context);
    final _authUser = ref.watch(authUserProvider);
    final _database = ref.watch(databaseProvider);


    /// Name field
    final nameField = TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        contentPadding: EdgeInsets.symmetric(
            vertical: screenHeight! * 0.02, horizontal: screenWidth! * 0.05),
        hintText: "Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Designation Field
    final designationField = TextFormField(
      autofocus: false,
      controller: designationController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        designationController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.work),
        contentPadding: EdgeInsets.symmetric(
            vertical: screenHeight! * 0.02, horizontal: screenWidth! * 0.05),
        hintText: "Designation",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Bio Field
    final bioField = TextField(
      autofocus: false,
      controller: bioController,
      minLines: 1,
      maxLines: 4,
      keyboardType: TextInputType.text,
      onSubmitted: (value) {
        bioController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.school),
        contentPadding: EdgeInsets.symmetric(
            vertical: screenHeight! * 0.02, horizontal: screenWidth! * 0.05),
        hintText: "Bio",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Continue Button
    final continueButton = Material(
      elevation: 5,
      color: AppColor.buttoncolor,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: () {
          Toast.show("Profile Created",
              duration: Toast.lengthShort, gravity: Toast.bottom);

          UserModel user = UserModel(
            uid: _authUser.uid,
            name: nameController.text,
            designation: designationController.text,
            bio: bioController.text,
            email: _authUser.email!,
            imageURL: _authUser.photoURL!,
            connectedList: [],
            github: "",
            linkedin: "",
            twitter: "",
            portfolio: "",
            isPrivate: false,
          );
          _database.addUserData(user);
          Navigator.pushReplacementNamed(context, RoutePath.routeToProfileScreen);
        },
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width * 0.5,
        child: const Text(
          " Continue ",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(screenHeight! * 0.04),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                        child: authUserProvider == null
                            ? Image.asset("assets/animation.gif")
                            : CircleAvatar(
                                radius: 75,
                                backgroundImage:
                                    NetworkImage(_authUser.photoURL!),
                              ),
                        // child: Image.asset("assets/animation.gif"),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      nameField,
                      SizedBox(
                        height: 20,
                      ),
                      designationField,
                      SizedBox(
                        height: 20,
                      ),
                      bioField,
                      SizedBox(
                        height: 20,
                      ),
                      continueButton,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
