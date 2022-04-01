import 'package:flutter/material.dart';
import 'package:software_engineering/screens/homepage/widgets/account_balance_and_ticket.dart';
import 'package:software_engineering/widgets/bus_tile.dart';

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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Good morning,\nDr Ibrahim"),
              CircleAvatar()
            ],
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
