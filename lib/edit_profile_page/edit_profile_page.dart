import 'package:flutter/material.dart';
import 'package:software_engineering/utils/constants.dart';
import 'package:software_engineering/widgets/custom_button.dart';
import 'package:software_engineering/widgets/custom_text_field.dart';
import 'package:software_engineering/widgets/input_section.dart';

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

  @override
  void initState() {
    super.initState();
    name.text = widget.name;
    email.text = widget.email;
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
        body: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                minRadius: 80,
              ),
            ),

            SizedBox(
              width: size.width * 0.9,
              child: InputSection(
                labels: const [
                  "Full name",
                  "Email",
                  "Password"
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
                  ]
              ),
            ),

            CustomButton(text: "Save", onPressed: (){

            })
          ],
        )
    );
  }
}
