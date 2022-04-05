

import "package:flutter/material.dart";
import 'package:software_engineering/screens/notification_screen/widgets/notification_tile.dart';
import 'package:software_engineering/utils/constants.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ashesiRedLight,
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
        backgroundColor: ashesiRed,
      ),
      body: ListView.builder(
          itemBuilder: (context,snapshot)=> NotificationTile()
      ),
    );
  }
}
