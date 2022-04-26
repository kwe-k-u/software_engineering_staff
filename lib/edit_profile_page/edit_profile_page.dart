import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:software_engineering/models/app_state.dart';
import 'package:software_engineering/utils/constants.dart';
import 'package:software_engineering/utils/firestore_helper.dart';
import 'package:software_engineering/widgets/custom_button.dart';
import 'package:software_engineering/widgets/custom_text_field.dart';
import 'package:software_engineering/widgets/input_section.dart';

class EditProfilePage extends StatefulWidget {
  final String name;
  final String email;
  final String? image;
  const EditProfilePage({
    Key? key,
    required this.name,
    required this.email,
    required this.image,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  File? image;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    name.text = widget.name;
    email.text = widget.email;
  }

  void changeImage() async{
    XFile? e = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (e != null){
      setState(() {
        image = File(e.path);
      });
    }
  }


  Widget showImage(){
    if (image != null){
      return Image.file(image!,);
    } else if (widget.image != null){
      return Image.network(widget.image!);
    }
    return const Icon(Icons.image);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: ashesiRedLight,
        appBar: AppBar(
          backgroundColor: ashesiRed,
          title: const Text("Edit Profile"),
          centerTitle: true,
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: changeImage,
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      minRadius: 80,
                      maxRadius: 90,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                          child: showImage()),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: changeImage,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(ashesiRed)),
                    child: const Text("Change Photo")),
                SizedBox(
                  width: size.width * 0.9,
                  child: InputSection(formKey: formKey, labels: [
                    "Full name",
                    "Email",
                    "Password",
                    password.text.isEmpty ? "" : "Confirm Password"
                  ], inputs: [
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
                      validator: (v) {
                        if (password.text.compareTo(cPassword.text) != 0) {
                          return 'Your passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                      text: "Save",
                      width: size.width * 0.8,
                      onPressed: () async{
                        bool? updated = await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: const Text(
                                    "Are you sure you want to update your profile with these changes?",
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "No",
                                          style: TextStyle(color: Colors.red),
                                        )),
                                    TextButton(
                                        onPressed: () async {
                                          if (formKey.currentState!.validate()) {
                                            // Navigator.pop(context);
                                            FirebaseAuth auth = context.read<AppState>().auth!;

                                            List<Future> futures = [];

                                            if (password.text.isNotEmpty){
                                              futures.add(auth.currentUser!.updatePassword(password.text));
                                            }
                                            if (name.text != widget.name){
                                              futures.add(auth.currentUser!.updateDisplayName(name.text));
                                            }
                                            if (image != null){
                                              String url = await uploadImage(image: image!, id: auth.currentUser!.uid);
                                              futures.add(auth.currentUser!.updatePhotoURL(url));
                                            }

                                            await Future.wait(futures);
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Updating profile")))
                                            Navigator.pop(context, true);
                                          }
                                        },
                                        child: const Text("Yes, change profile"))
                                  ],
                                ));

                        // Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
