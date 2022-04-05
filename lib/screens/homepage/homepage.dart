import 'package:flutter/material.dart';
import 'package:software_engineering/models/app_state.dart';
import 'package:software_engineering/screens/homepage/widgets/account_balance_and_ticket.dart';
import 'package:software_engineering/widgets/bus_tile.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                        text: "Good morning,\n",
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                              text: context.read<AppState>().auth!.currentUser!.displayName!,
                            style: Theme.of(context).textTheme.titleLarge
                          )
                        ]
                    )
                ),
                CircleAvatar()
              ],
            ),
          ),


          AccountBalanceAndTicket(),


          // const SizedBox(
          //   height: 8,
          // ),



          const Text("Available buses "),
          Expanded(
            child: ListView.builder(itemBuilder: (context,index)=> BusTile()),
          )
        ],
      ),
    );
  }
}
