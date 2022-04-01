import 'package:flutter/material.dart';
import 'package:software_engineering/screens/homepage/homepage.dart';
import 'package:software_engineering/utils/constants.dart';

class PageControl extends StatefulWidget {
  const PageControl({Key? key}) : super(key: key);

  @override
  _PageControlState createState() => _PageControlState();
}

class _PageControlState extends State<PageControl> {

  
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: ashesiRedLight,
            body: TabBarView(
              children: [
                Homepage(),
                Text("2"),
                Text("3"),
                Text("4"),
              ],
            ),
          bottomNavigationBar: SizedBox(
            child: TabBar(
              labelColor: ashesiRed,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(icon: Icon(Icons.home), text: "Home",),
                Tab(icon: Icon(Icons.history), text: "History",),
                Tab(icon: Icon(Icons.notifications_outlined), text: "Notifications",),
                Tab(icon: Icon(Icons.settings), text: "Settings",),
              ],
            ),
          ),
          ),
      ),
    );
  }
}
