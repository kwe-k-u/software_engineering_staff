import 'package:flutter/material.dart';
import 'package:software_engineering/models/app_state.dart';
import 'package:software_engineering/screens/homepage/widgets/account_balance_and_ticket.dart';
import 'package:software_engineering/utils/constants.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(fontSize: 26)
                          )
                        ]
                    )
                ),
                 CircleAvatar(
                  maxRadius: 25,
                  child: context.read<AppState>().auth!.currentUser!.photoURL != null ? 
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                      child: Image.network(context.read<AppState>().auth!.currentUser!.photoURL!)
                  ) 
                      : const Icon(Icons.account_circle_outlined,size: 50,),
                )
              ],
            ),
          ),


          const AccountBalanceAndTicket(),


          // const SizedBox(
          //   height: 8,
          // ),



          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Available buses ",
                  style: Theme.of(context).textTheme.labelLarge!
                  .copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                TextButton(onPressed: (){}, child: Text("Select day", style: Theme.of(context).textTheme.bodyText1!.copyWith(color: ashesiRed),))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context,index)=> BusTile()),
          )
        ],
      ),
    );
  }
}
