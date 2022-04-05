import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:software_engineering/models/app_state.dart';
import 'package:software_engineering/screens/about_page/about_page.dart';
import 'package:software_engineering/widgets/custom_button.dart';
import 'package:software_engineering/widgets/heading_text.dart';
import 'package:provider/provider.dart';



class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left)
                ),
                Spacer(),
                HeadingText("Profile"),
                Spacer(),
              ],
            ),


            CircleAvatar(
              minRadius: 60,
              maxRadius: 60,
            ),

            HeadingText(context.read<AppState>().auth!.currentUser!.displayName!),

            CustomButton(text: "LOG OUT", onPressed: (){
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut();
            }),

            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit text"),
              trailing: Icon(Icons.chevron_right),
            ),

            ListTile(
              leading: Icon(Icons.credit_card_rounded),
              title: Text("Payment methods"),
              trailing: Icon(Icons.chevron_right),
            ),

            ListTile(
              leading: Icon(Icons.notifications_outlined),
              title: Text("Notifications"),
              trailing: Icon(Icons.chevron_right),
            ),

            ListTile(
              leading: Icon(Icons.bug_report_outlined),
              title: Text("Report a problem"),
              trailing: Icon(Icons.chevron_right),
            ),

            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=> const AboutPage()
                    )
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
