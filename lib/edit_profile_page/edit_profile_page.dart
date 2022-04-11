import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:software_engineering/models/app_state.dart';
import 'package:software_engineering/utils/constants.dart';
import 'package:software_engineering/widgets/custom_button.dart';
import 'package:software_engineering/widgets/custom_text_field.dart';
import 'package:software_engineering/widgets/input_section.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  final String name;
  final String email;
  const EditProfilePage({Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();
//todo password validation
  @override
  void initState() {
    super.initState();
    name.text = widget.name;
    email.text = widget.email;
  }

  void changeImage() {

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ashesiRedLight,
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              InkWell(
                onTap: changeImage,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    minRadius: 80,
                  ),
                ),
              ),

              ElevatedButton(
                  onPressed: changeImage,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(ashesiRed)
                  ),
                  child: Text("Change Photo")
              ),

              SizedBox(
                width: size.width * 0.9,
                child: InputSection(
                  labels:  [
                    "Full name",
                    "Email",
                    "Password",
                    password.text.isEmpty ? "" : "Confirm Password"
                  ],
                    inputs: [
                      CustomTextField(
                        controller: name,
                      ),
                      CustomTextField(
                        controller: email,
                      ),
                      CustomTextField(
                        controller: password,
                        obscureText: true,
                      ),

                      CustomTextField(
                        controller: cPassword,
                        obscureText: true,
                        visibility: password.text.isNotEmpty,
                      ),


                    ]
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    text: "Save",
                    width: size.width * 0.8,
                    onPressed: (){
                    showDialog(
                        context: context, builder:
                        (context)=> AlertDialog(
                          content: const Text("Are you sure you want to update your profile with these changes?",),
                          actions: [
                            TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: const Text("No", style: TextStyle(
                              color: Colors.red
                            ),)),
                            TextButton(
                                onPressed: ()async {
                                  Navigator.pop(context);
                                  FirebaseAuth auth = context.read<AppState>().auth!;
                                  await Future.wait([
                                    // auth.currentUser!.updateDisplayName(name.text),
                                    // auth.currentUser!.updateEmail(email.text),
                                    // auth.currentUser!.updatePassword(password.text)
                                  ]);
                                Navigator.pop(context);
                                },
                                child: const Text("Yes, change profile")
                            )
                          ],
                        )
                    );
                    }),
              )
            ],
          ),
        )
    );
  }
}
