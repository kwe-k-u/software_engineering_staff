import "package:flutter/material.dart";
import 'package:software_engineering/widgets/custom_button.dart';



class AccountBalanceAndTicket extends StatefulWidget {
  const AccountBalanceAndTicket({Key? key}) : super(key: key);

  @override
  _AccountBalanceAndTicketState createState() => _AccountBalanceAndTicketState();
}

class _AccountBalanceAndTicketState extends State<AccountBalanceAndTicket> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(24),
      height: size.height * 0.3,
      child: Column(
        children: [

          _CreditBalance(),
          _UnusedTickets()

        ],
      ),
    );
  }
}





class _CreditBalance extends StatelessWidget {
  const _CreditBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      margin: EdgeInsets.zero,
      child:
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Ashesi Bus Credit Balance"),
                  Text("GHC 0.00"),
                ],
              ),
              CustomButton(
                  text: "TOP UP",
                  onPressed: (){},
                radius: 6,
              )
            ],
      ),
        ),
    );
  }
}




class _UnusedTickets extends StatelessWidget {
  const _UnusedTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      child:
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Text("Unused Tickets",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text("Ashesi Bus Credit Balance"),
                      Text("GHC 0.00"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("GHC 0.00"),
                      Text("Bought on Mon 22 Feb 2022")
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
