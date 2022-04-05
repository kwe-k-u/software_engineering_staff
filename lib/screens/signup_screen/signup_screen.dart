
import "package:flutter/material.dart";
import 'package:software_engineering/models/app_state.dart';
import 'package:software_engineering/screens/login_screen/login_screen.dart';
import 'package:software_engineering/widgets/curved_background.dart';
import 'package:software_engineering/widgets/custom_button.dart';
import 'package:software_engineering/widgets/custom_text_field.dart';
import 'package:software_engineering/widgets/heading_text.dart';
import 'package:software_engineering/widgets/input_section.dart';
import 'package:provider/provider.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CurvedBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeadingText("Sign Up"),
            Spacer(flex: 3,),
            InputSection(
                inputs: [
                  CustomTextField(
                    controller: name,
                    hintText: "Full Name",
                  ),

                  CustomTextField(
                    controller: email,
                    hintText: "someone@ashesi.edu.gh",
                    icon: Icons.account_circle_outlined,
                  ),

                  CustomTextField(
                    controller: password,
                    hintText: "Password",
                    obscureText: true,
                    icon: Icons.lock_outline,
                  ),

                  CustomTextField(
                    controller: cPassword,
                    hintText: "Confirm Password",
                    icon: Icons.lock_outline,
                    obscureText: true,
                  ),

                ]),

            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.info),
                Text("This app is only for\nAshesi faculty"),
                CustomButton(text: "Create Account", onPressed: (){

                  context.read<AppState>().signup(email: email.text, name: name.text, password: password.text);

                })
              ],
            ),
            Spacer(),
            Text("Already have an account?"),
            TextButton(onPressed: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=> LoginScreen()
                  )
              );
            }, child: Text("Sign In"))
          ],
        )
    );
  }
}
