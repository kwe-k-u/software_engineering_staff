import 'package:flutter/material.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This app was designed and built by Team Arachnida of Class of 2023.")
          ],
        )
    );
  }
}
