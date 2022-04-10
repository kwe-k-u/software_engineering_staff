import 'package:flutter/material.dart';
import 'package:software_engineering/screens/homepage/homepage.dart';
import 'package:software_engineering/screens/notification_screen/notification_screen.dart';
import 'package:software_engineering/screens/settings_screen/settings_screen.dart';
import 'package:software_engineering/screens/ticket_history/ticket_history.dart';
import 'package:software_engineering/utils/constants.dart';
import 'package:software_engineering/widgets/ticket_reciept.dart';

class PageControl extends StatefulWidget {
  const PageControl({Key? key}) : super(key: key);

  @override
  _PageControlState createState() => _PageControlState();
}

class _PageControlState extends State<PageControl> with SingleTickerProviderStateMixin{
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  DefaultTabController(

        length: 4,
        child: Scaffold(
          backgroundColor: ashesiRedLight,
            body: TabBarView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                Homepage(),
                TicketHistory(),
                NotificationScreen(),
                SettingsScreen(),
              ],
            ),
          bottomNavigationBar: SizedBox(
            child: TabBar(
              controller: controller,
              onTap: (index){
                if (index==3){Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=> SettingsScreen()
                    )
                );
                  controller.animateTo(controller.previousIndex);
                } else {
                  controller.animateTo(index);
                }
              },
              physics: NeverScrollableScrollPhysics(),
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
