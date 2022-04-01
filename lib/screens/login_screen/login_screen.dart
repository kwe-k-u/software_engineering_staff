
import "package:flutter/material.dart";
import 'package:software_engineering/screens/page_control/page_control.dart';
import 'package:software_engineering/widgets/curved_background.dart';
import 'package:software_engineering/widgets/custom_button.dart';
import 'package:software_engineering/widgets/custom_text_field.dart';
import 'package:software_engineering/widgets/heading_text.dart';
import 'package:software_engineering/widgets/input_section.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CurvedBackground(
      marginHeight:  0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeadingText("Login"),
            Spacer(flex: 2,),
            InputSection(
                inputs: [

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

                ]),

            // SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Forgot your password?"),
                CustomButton(text: "Log In", onPressed: (){
                  Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=> PageControl()
                      )
                  );
                })
              ],
            ),
            SizedBox(height: 50,),
            Text("Don't have an account?"),
            TextButton(onPressed: (){}, child: Text("Sign Up"))
            ],
        )
    );
  }
}
