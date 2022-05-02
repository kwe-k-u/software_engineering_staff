import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:software_engineering/edit_profile_page/edit_profile_page.dart';
import 'package:software_engineering/models/app_state.dart';
import 'package:software_engineering/screens/about_page/about_page.dart';
import 'package:software_engineering/widgets/custom_button.dart';
import 'package:software_engineering/widgets/heading_text.dart';
import 'package:provider/provider.dart';
import 'package:software_engineering/widgets/profile_image.dart';



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
                    icon: const Icon(Icons.chevron_left)
                ),
                const Spacer(),
                const HeadingText("Profile"),
                const Spacer(),
              ],
            ),


             CircleAvatar(
              minRadius: 40,
              maxRadius: 60,
              child: context.read<AppState>().auth!.currentUser!.photoURL != null ?
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                  child: Image.network(context.read<AppState>().auth!.currentUser!.photoURL!)
              )
                  : const Icon(Icons.account_circle_outlined,size: 80,),
            ),
            // ProfileImage(),

            HeadingText(context.read<AppState>().auth!.currentUser!.displayName!),

            CustomButton(
                text: "LOG OUT",
                onPressed: (){
                  FirebaseAuth auth = FirebaseAuth.instance;
                  auth.signOut();
                }),

            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("Edit Profile"),
              trailing: const Icon(Icons.chevron_right),
              onTap: (){
                User user = context.read<AppState>().auth!.currentUser!;

                Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=> EditProfilePage(
                      email: user.email!,
                      name: user.displayName!,
                    )
                    )
                );
              },
            ),

            const ListTile(
              leading: Icon(Icons.credit_card_rounded),
              title: Text("Payment methods"),
              trailing: Icon(Icons.chevron_right),
            ),

            const ListTile(
              leading: Icon(Icons.notifications_outlined),
              title: Text("Notifications"),
              trailing: const Icon(Icons.chevron_right),
            ),

            const ListTile(
              leading: const Icon(Icons.bug_report_outlined),
              title: const Text("Report a problem"),
              trailing: const Icon(Icons.chevron_right),
            ),

            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("About"),
              trailing: const Icon(Icons.chevron_right),
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
