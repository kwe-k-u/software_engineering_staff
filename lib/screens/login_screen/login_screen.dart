
import "package:flutter/material.dart";
import 'package:software_engineering/models/app_state.dart';
import 'package:software_engineering/screens/signup_screen/signup_screen.dart';
import 'package:software_engineering/widgets/curved_background.dart';
import 'package:software_engineering/widgets/custom_button.dart';
import 'package:software_engineering/widgets/custom_text_field.dart';
import 'package:software_engineering/widgets/heading_text.dart';
import 'package:software_engineering/widgets/input_section.dart';
import 'package:provider/provider.dart';

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
                  context.read<AppState>().auth!.signInWithEmailAndPassword(email: email.text, password: password.text);
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context)=> SignupScreen()
                  //     )
                  // );
                })
              ],
            ),
            SizedBox(height: 50,),
            Text("Don't have an account?"),
            TextButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> SignupScreen()
                      )
                  );

                },
                child: Text("Sign Up"))
            ],
        )
    );
  }
}
